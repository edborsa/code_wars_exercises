export function determinant(m) {
  if (m.length === 1) {
    return m[0][0];
  } else {
    var res = 0;
    m[0].forEach((e, i) => {
      res += Math.pow(-1, i) * e * determinant(minor(m, i));
    });
    return res;
  }
}

function minor(m, i) {
  return m
    .slice(0)
    .splice(1)
    .map((e) => e.filter((_, idx) => i != idx));
}
