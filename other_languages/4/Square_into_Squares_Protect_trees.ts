export class G964 {
  public static decompose = (n) => decomposeS(n * n, n);
}
const decomposeS = (s, prev) => {
  const d: number[] | null = null;
  for (let i = prev - 1; i > 0; i--) {
    const t = i * i;
    if (s == t) return [i];
    else if (s > t) {
      const d = decomposeS(s - t, i);
      if (d) return [...d, i];
    }
  }
  return d;
};
