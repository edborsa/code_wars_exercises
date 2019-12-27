export const nextBigger = (n: number) => {
  let max = maxify(n);
  while (++n <= max) {
    if (maxify(n) === max) {
      return n;
    }
  }
  return -1;
};

const maxify = (n: number) => {
  return +[...`${n}`]
    .map((n) => +n)
    .sort((a, b) => b - a)
    .join("")
    .replace(/^(0+)([1-9])/, "$2$1");
};
