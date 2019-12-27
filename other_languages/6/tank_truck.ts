export class G964 {
  public static tankvol(h: number, d: number, vt: number): number {
    const R: number = d / 2;
    const cylLength: number = vt / (Math.PI * R ** 2);

    const S_sec: number = R ** 2 * Math.acos(1 - h / R);

    const S_rect: number = (R - h) * Math.sqrt(2 * R * h - h ** 2);

    const S_liquid: number = S_sec - S_rect;

    const remaining: number = S_liquid * cylLength;

    return Math.floor(remaining);
  }
}
