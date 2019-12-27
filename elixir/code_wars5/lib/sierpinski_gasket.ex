defmodule SierpinskiGasket do
  def sierpinski(n), do: forge(0, n, ["L"]) |> Enum.join("\n")

  defp forge(c, n, r) when c >= n, do: r

  defp forge(c, n, r),
    do:
      forge(
        c + 1,
        n,
        r ++
          Enum.map(
            r,
            fn v ->
              String.pad_trailing(v, trunc(:math.pow(2, c + 1))) <> v
            end
          )
      )
end
