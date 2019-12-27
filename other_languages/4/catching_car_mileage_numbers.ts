export function isInteresting(
  n: number,
  awesomePhrases: number[],
  iteration = 0,
  awesomeness = 2
): number {
  switch (true) {
    case /^[1-9]0{2,}$/.test(n.toString()):
    case /^(.)\1{2,}$/.test(n.toString()):
    case n.toString().length > 2 && "1234567890".includes(n.toString()):
    case n.toString().length > 2 && "9876543210".includes(n.toString()):
    case n.toString().length > 2 &&
      n.toString() === n.toString().split("").reverse().join(""):
    case awesomePhrases.includes(n): // matches an "awesome phrase"
      return awesomeness;
    default:
      if (iteration < 2) {
        return isInteresting(++n, awesomePhrases, ++iteration, 1);
      }
      return 0;
  }
}
