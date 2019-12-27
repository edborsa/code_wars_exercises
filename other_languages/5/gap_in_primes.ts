export class G964 {
  public static gap = (g: number, m: number, n: number): number[] => {
    let store: number;
    for (let i = m; i <= n; i++) {
      if (G964.isPrime(i)) {
        if (i - store === g) {
          return [store, i];
        } else {
          store = i;
        }
      }
    }
    return null;
  };

  public static isPrime = (n: number): boolean => {
    for (let x = Math.floor(Math.sqrt(n)); x > 1; x--) {
      if (n % x === 0) {
        return false;
      }
    }
    return true;
  };
}
