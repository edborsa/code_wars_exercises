export class G964 {
  private static part_aux = (s, k) => {
    var k0 = Math.min(s, k);
    if (k0 < 1) return [];
    var res = [];
    for (var n = k0; n > 0; n--) {
      var r = s - n;
      if (r > 0) {
        var arr = G964.part_aux(r, n);
        for (var i = 0; i < arr.length; i++) {
          var a = arr[i];
          if (Array.isArray(a) === true) res.push([n].concat(a));
          else res.push([n, a]);
        }
      } else res.push([n]);
    }
    return res;
  };
  private static prod = (u) => {
    return u.reduce(function (a, b) {
      return a * b;
    }, 1);
  };
  public static part = (n) => {
    var r = G964.part_aux(n, n)
      .map(G964.prod)
      .sort(function (a, b) {
        return a - b;
      });
    r = r.filter(function (item, pos) {
      return r.indexOf(item) == pos;
    });
    var lg = r.length;
    var avg =
      r.reduce(function (s, x) {
        return s + x;
      }) / lg;
    var rge = r[lg - 1] - r[0];
    var md = (r[~~((lg - 1) / 2)] + r[~~(lg / 2)]) / 2;
    return (
      "Range: " +
      rge +
      " Average: " +
      avg.toFixed(2) +
      " Median: " +
      md.toFixed(2)
    );
  };
}
