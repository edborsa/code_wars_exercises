export function saveMark(c1: string, c2: string): string {
  // Don't be daunted! You can do this. Believe in yourself.
  const lat1: number =
    Number(c1.substring(0, 5)) *
    (c1.substring(7, 8) === "N" ? 1 : -1) *
    (Math.PI / 180);
  const long1: number =
    Number(c1.substring(10, 15)) *
    (c1.substring(17) === "E" ? 1 : -1) *
    (Math.PI / 180);
  const lat2: number =
    Number(c2.substring(0, 5)) *
    (c2.substring(7, 8) === "N" ? 1 : -1) *
    (Math.PI / 180);
  const long2: number =
    Number(c2.substring(10, 15)) *
    (c2.substring(17) === "E" ? 1 : -1) *
    (Math.PI / 180);
  const r: number = 3390;
  const distance: number =
    Math.floor(
      (2 *
        r *
        Math.asin(
          Math.sqrt(
            Math.pow(Math.sin((lat2 - lat1) / 2), 2) +
              Math.cos(lat1) *
                Math.cos(lat2) *
                Math.pow(Math.sin((long2 - long1) / 2), 2)
          )
        )) /
        10
    ) * 10;

  return distance.toString() + "KM";
}
