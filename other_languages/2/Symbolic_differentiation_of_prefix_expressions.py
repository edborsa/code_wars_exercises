binaryOps = ['+', '-', '*', '/', '^']
unaryOps = ['cos', 'sin', 'tan', 'exp', 'ln']


def tokenize(expression):
    return expression.replace('(', ' ( ').replace(')', ' ) ').split()


def buildTree(tokens):
    if tokens[0] == '(':
        del tokens[0]
        op = tokens[0]
        del tokens[0]
        if op in binaryOps:
            T = (op, buildTree(tokens), buildTree(tokens))
        elif op in unaryOps:
            T = (op, buildTree(tokens))
        else:
            raise ValueError('Syntax Error: Operator Expected')
        del tokens[0]
        return T
    else:
        T = tokens[0]
        if T.isnumeric():
            T = int(T)
        del tokens[0]
        return T


def treeToString(t):
    if type(t) == tuple:
        op = t[0]
        if op in binaryOps:
            return '(' + t[0] + ' ' + treeToString(t[1]) + ' ' + treeToString(t[2]) + ')'
        elif op in unaryOps:
            return '(' + t[0] + ' ' + treeToString(t[1]) + ')'
        else:
            raise ValueError('Syntax Error: Operator Expected')
    else:
        return str(t)


def reduceT(t):
    if type(t) == int or t == 'x':
        return t

    op = t[0]

    a = reduceT(t[1])
    b = None

    if len(t) == 3:
        b = reduceT(t[2])

    if op == 'ln':
        if a == 1:
            return 0
        if type(a) == int and a <= 0:
            raise ValueError('Cannot evaluate ln of non-positive number')

    if op == 'exp':
        if a == 0:
            return 1

    if op == '+':
        if type(a) == int and type(b) == int:
            return a + b
        if a == 0:
            return b
        if b == 0:
            return a

    if op == '-':
        if type(a) == int and type(b) == int:
            return a - b
        if a == 0:
            return b
        if b == 0:
            return a

    if op == '*':
        if type(a) == int and type(b) == int:
            return a * b
        if a == 1:
            return b
        if b == 1:
            return a
        if a == 0 or b == 0:
            return 0
        if type(b) == int and type(a) != int:
            a,b = b,a
        if a == b:
            op = '^'
            a = a
            b = 2
        if type(a) == tuple and a[0] == '/' and a[2] == b:
            return a[1]
        if type(b) == tuple and b[0] == '/' and b[2] == a:
            return b[1]

    if op == '/':
        if type(a) == int and type(b) == int:
            return a / b
        if b == 1:
            return a
        if a == 1 and type(b) == tuple and b[0]=='^':
            op = '^'
            a = b[1]
            b = b[2]*-1

    if op == '^':
        if b == 0:
            return 1
        if b == 1:
            return a

    if len(t) == 3:
        return op, a, b
    else:
        return op, a


def add(a, b):
    return '+', a, b


def sub(a, b):
    return '-', a, b


def mult(a, b):
    return '*', a, b


def div(a, b):
    return '/', a, b


def dif(t):
    if type(t) == tuple:
        op = t[0]

        if op in ['+', '-']:
            return op, dif(t[1]), dif(t[2])

        if op == '*':
            f = t[1]
            g = t[2]
            return add(mult(dif(f), g), mult(dif(g), f))

        if op == '/':
            f = t[1]
            g = t[2]
            numerator = sub(mult(dif(f), g), mult(dif(g), f))
            denominator = mult(g, g)
            return div(numerator, denominator)

        if op == 'cos':
            arg = t[1]
            p = mult(-1, ('sin', arg))
            gdiff = dif(arg)
            return mult(p, gdiff)

        if op == 'sin':
            arg = t[1]
            p = ('cos', arg)
            gdiff = dif(arg)
            return mult(p, gdiff)

        if op == 'tan':
            arg = t[1]
            p = ('cos', arg)
            q = ('/', 1, mult(p, p))
            gdiff = dif(arg)
            return mult(q, gdiff)

        if op == 'ln':
            arg = t[1]
            p = ('/', 1, arg)
            gdiff = dif(arg)
            return mult(p, gdiff)

        if op == 'exp':
            arg = t[1]
            gdiff = dif(arg)
            return mult(t, gdiff)

        if op == '^':
            f = t[1]
            g = t[2]

            if type(f) == int and type(g) == int:
                return 0
            if type(f) == int and type(g) != int:
                return mult(mult(('ln',f),t),dif(g))
            if type(f) != int and type(g) == int:
                return mult(mult(g, ('^', f, sub(g,1))),dif(f))


            diffF = dif(f)
            diffG = dif(g)

            f2g = ('^', f, g)

            part1 = div(mult(g, diffF), f)
            part2 = mult(diffG, ('ln', f))

            return mult(f2g, add(part1, part2))

        raise ValueError('Syntax Error: Operator Expected')

    if t == 'x':
        return 1

    if type(t) == int:
        return 0

    raise ValueError('Syntax Error')


def diff(s):
    tokens = tokenize(s)
    tree = buildTree(tokens)
    diffedTree = dif(tree)
    reduced = reduceT(diffedTree)
    outStr = treeToString(reduced)
    return outStr


s = "(^ x 2)"
tokens = tokenize(s)
tree = buildTree(tokens)
diffedTree = dif(tree)
reduced = reduceT(diffedTree)
outStr = treeToString(reduced)
