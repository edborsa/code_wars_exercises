function unbleach(n: string): string {
  return (n || "").replace(/ /g, "s").replace(/\t/g, "t").replace(/\n/g, "n");
}

// imp, command, [parameter]
type Program = (
  | [string, string]
  | [string, string, string]
  | [string, string, number]
)[];

class Parser {
  private index = 0;
  constructor(private code: string) {}

  public parse(): Program {
    const program: Program = [];
    let imp: string;
    while ((imp = this.pullImp())) {
      switch (imp) {
        case " ": // Stack Manipulation
          const c = this.pullChar();
          if (c === " ") {
            program.push([imp, c, this.pullNumber()]);
          } else if (c === "\t") {
            program.push([
              imp,
              c + this.pullSome(" ", "\n"),
              this.pullNumber(),
            ]);
          } else {
            program.push([imp, c + this.pullChar()]);
          }
          break;
        case "\t ": // Arithmetic
          program.push([imp, this.pullSome("  ", " \t", " \n", "\t ", "\t\t")]);
          break;
        case "\t\t": // Heap Access
          program.push([imp, this.pullSome(" ", "\t")]);
          break;
        case "\t\n": // Input/Output
          program.push([imp, this.pullSome("  ", " \t", "\t ", "\t\t")]);
          break;
        case "\n": // Flow Control
          const cmd = this.pullSome(
            "  ",
            " \t",
            " \n",
            "\t ",
            "\t\t",
            "\t\n",
            "\n\n"
          );
          if (cmd === "\t\n" || cmd === "\n\n") {
            program.push([imp, cmd]);
          } else {
            program.push([imp, cmd, this.pullLabel()]);
          }
          break;
        default:
          throw new Error("Invalid IMP");
      }
    }
    return program;
  }

  private pullNumber(): number {
    const sign = this.pullChar();
    if (sign !== "\t" && sign !== " ") {
      throw new Error("Invalid number sign");
    }

    const digits = this.pullUntil("\n");
    if (digits === "") {
      return 0;
    }
    return (
      parseInt(digits.replace(/ /g, "0").replace(/\t/g, "1"), 2) *
      (sign === "\t" ? -1 : 1)
    );
  }

  private pullLabel(): string {
    return this.pullUntil("\n");
  }

  private pullImp(): string {
    const c1 = this.pullChar();
    if (!c1) {
      return "";
    }
    if (c1 === "\t") {
      const c2 = this.pullChar();
      if (!c2) {
        throw new Error("Invalid IMP");
      }
      return c1 + c2;
    }
    return c1;
  }

  private pullUntil(terminal: string): string {
    let out = "";
    let c: string;
    while ((c = this.pullChar())) {
      if (c === terminal) {
        return out;
      }
      out += c;
    }
    throw new Error("Unterminated parameter");
  }

  private pullSome(...options: string[]): string {
    const max = Math.max(...options.map((opt) => opt.length));
    let out = "";
    let c: string;
    while ((c = this.pullChar())) {
      out += c;
      if (out.length > max) {
        throw new Error("Invalid instruction");
      }
      if (options.includes(out)) {
        return out;
      }
    }
    throw new Error("No instruction found");
  }

  private pullChar(): string {
    while (this.index < this.code.length) {
      const c = this.code[this.index];
      this.index += 1;
      if (c === " " || c === "\t" || c === "\n") {
        return c;
      }
    }
    return "";
  }
}

class Interpreter {
  public output = "";
  private stack: number[] = [];
  private heap = new Map<number, number>();

  private pc = 0;
  private callstack: number[] = [];

  private inputIndex = 0;
  private labels = new Map<string, number>();

  constructor(private program: Program, private input: string) {
    for (const [i, [imp, cmd, arg]] of this.program.entries()) {
      if (imp === "\n" && cmd === "  " && typeof arg === "string") {
        if (this.labels.has(arg)) {
          throw new Error(`Duplicate label: ${unbleach(arg)}`);
        }
        this.labels.set(arg, i);
      }
    }
  }

  private pop(): number {
    const n = this.stack.pop();
    if (n === undefined) {
      throw new Error("pop on an empty stack");
    }
    return n;
  }

  private read(): string {
    const c = this.input[this.inputIndex];
    if (c === undefined) {
      throw new Error("read on empty input");
    }
    this.inputIndex += 1;
    return c;
  }

  private readUntil(terminator: string): string {
    let out = "";
    let c;
    while ((c = this.read()) !== terminator) {
      out += c;
    }
    return out;
  }

  private jump(label: string): void {
    const target = this.labels.get(label);
    if (target === undefined) {
      throw new Error(`Jump to unknown label: ${unbleach(label)}`);
    }
    this.pc = target + 1;
  }

  public run(): void {
    main: while (this.pc < this.program.length) {
      const [imp, cmd, arg] = this.program[this.pc];
      let a: number;
      let b: number;
      let s: string;
      let maybe: number | undefined;
      switch (imp + cmd) {
        // Stack Manipulation
        case "  ": // Push n onto the stack.
          this.stack.push(arg as number);
          break;
        case " \t ": // Duplicate the nth value from the top of the stack and push onto the stack.
          maybe = this.stack[this.stack.length - (arg as number) - 1];
          if (maybe === undefined) {
            throw new Error("duplicate beyond stack");
          }
          this.stack.push(maybe);
          break;
        case " \t\n": // Discard the top n values below the top of the stack from the stack. (For n<**0** or **n**>=stack.length, remove everything but the top value.)
          if ((arg as number) < 0 || (arg as number) >= this.stack.length) {
            this.stack = [this.pop()];
          } else {
            const top = this.pop();
            this.stack = this.stack.slice(
              0,
              this.stack.length - (arg as number)
            );
            this.stack.push(top);
          }
          break;
        case " \n ": // Duplicate the top value on the stack.
          a = this.pop();
          this.stack.push(a, a);
          break;
        case " \n\t": // Swap the top two value on the stack.
          a = this.pop();
          b = this.pop();
          this.stack.push(a, b);
          break;
        case " \n\n":
          this.pop();
          break;
        // Arithmetic
        case "\t   ":
          a = this.pop();
          b = this.pop();
          this.stack.push(b + a);
          break;
        case "\t  \t":
          a = this.pop();
          b = this.pop();
          this.stack.push(b - a);
          break;
        case "\t  \n":
          a = this.pop();
          b = this.pop();
          this.stack.push(b * a);
          break;
        case "\t \t ":
          a = this.pop();
          b = this.pop();
          if (a === 0) {
            throw new Error("Division by zero");
          }
          this.stack.push(Math.floor(b / a));
          break;
        case "\t \t\t":
          a = this.pop();
          b = this.pop();
          if (a === 0) {
            throw new Error("Remainder of division by zero");
          }
          this.stack.push(b - a * Math.floor(b / a));
          break;

        case "\t\t ":
          a = this.pop();
          b = this.pop();
          this.heap.set(b, a);
          break;
        case "\t\t\t":
          a = this.pop();
          maybe = this.heap.get(a);
          if (maybe === undefined) {
            throw new Error("Undefined heap address");
          }
          this.stack.push(maybe);
          break;
        // Input/Output
        case "\t\n  ":
          this.output += String.fromCharCode(this.pop());
          break;
        case "\t\n \t":
          this.output += this.pop();
          break;
        case "\t\n\t ":
          s = this.read();
          b = this.pop();
          this.heap.set(b, s.charCodeAt(0));
          break;
        case "\t\n\t\t":
          a = parseInt(this.readUntil("\n"));
          b = this.pop();
          this.heap.set(b, a);
          break;
        // Flow Control
        case "\n  ":
          // no-op
          break;
        case "\n \t":
          this.callstack.push(this.pc);
          this.jump(arg as string);
          continue main;
        case "\n \n":
          this.jump(arg as string);
          continue main;
        case "\n\t ":
          if (this.pop() === 0) {
            this.jump(arg as string);
            continue main;
          }
          break;
        case "\n\t\t":
          if (this.pop() < 0) {
            this.jump(arg as string);
            continue main;
          }
          break;
        case "\n\t\n":
          maybe = this.callstack.pop();
          if (maybe === undefined) {
            throw new Error("return without being in a subroutine");
          }
          this.pc = maybe + 1;
          continue main;
        case "\n\n\n":
          return;
        default:
          throw new Error(`Unknown command: ${unbleach(imp + cmd)}`);
      }
      this.pc += 1;
    }
    throw new Error("Unclean termination");
  }
}

export function whitespace(code: string, input: string = ""): string {
  let parser = new Parser(code);
  let program = parser.parse();
  let interpreter = new Interpreter(program, input);
  interpreter.run();
  return interpreter.output;
}
