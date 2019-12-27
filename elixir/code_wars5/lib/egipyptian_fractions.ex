defmodule EgipyptianFractions do
  defp helper(0, _d, r), do: Enum.reverse(r)

  defp helper(n, d, r) do
    k = div(d + n - 1, n)
    helper(n * k - d, d * k, ["1/#{k}" | r])
  end

  def decompose("0"), do: []

  def decompose(s) do
    [n, d] =
      if String.contains?(s, ".") do
        [n, d] = s |> String.split(".") |> Enum.map(&String.to_integer/1)
        k = trunc(:math.pow(10, ceil(:math.log10(d))))
        [n * k + d, k]
      else
        s |> String.split("/") |> Enum.map(&String.to_integer/1)
      end

    {n, r} =
      if n > d do
        k = div(n, d)
        {n - k * d, ["#{k}"]}
      else
        {n, []}
      end

    helper(n, d, r)
  end
end
