export function interpreter(
  code: any,
  iterations: any,
  width: any,
  height: any
): any {
  code = code.replace(/[^nesw*\[\]]/g, "");
  const n = code.length;
  const jumps: any = {};
  for (let i = 0, j = 0, opens: any[] = []; i < n; ++i) {
    switch (code[i]) {
      case "[":
        opens.push(i);
        break;
      case "]":
        (j = opens.pop()), (jumps[i] = j), (jumps[j] = i);
        break;
    }
  }
  const grid: any = [...Array(height)].map((_) => [...Array(width)].fill(0));
  for (let i = 0, j = 0, y = 0, x = 0; i < n && j < iterations; ++i, ++j)
    switch (code[i]) {
      case "n":
        y = (y - 1 + height) % height;
        break;
      case "w":
        x = (x - 1 + width) % width;
        break;
      case "s":
        y = (y + 1) % height;
        break;
      case "e":
        x = (x + 1) % width;
        break;
      case "*":
        grid[y][x] ^= 1;
        break;
      case "[":
        if (grid[y][x] == 0) i = jumps[i];
        break;
      case "]":
        if (grid[y][x] != 0) i = jumps[i];
        break;
    }
  return grid.map((r: any) => r.join("")).join("\r\n");
}
