export const calculate = (sum: string): number | string => {
  const invalidChar = /[^0-9$\*\+-\.]/;
  if (invalidChar.test(sum)) return "400: Bad request";
  let res = sum
    .split("+")
    .map((s) =>
      s
        .split("-")
        .map((s) =>
          s
            .split("*")
            .map((s) =>
              s
                .split("$")
                .map(Number)
                .reduce((a, b) => a / b)
            )
            .reduce((a, b) => a * b)
        )
        .reduce((a, b) => a - b)
    )
    .reduce((a, b) => a + b);
  return res;
};
