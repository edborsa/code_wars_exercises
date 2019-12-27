defmodule Count9From1ToN do
  def number9(n), do: n |> Integer.digits() |> calc()

  defp calc([]), do: 0
  defp calc(d = [9 | t]), do: magic(d) + (Integer.undigits(t) + 1)
  defp calc(d), do: magic(d)

  defp magic([h | t]), do: h * :math.pow(10, length(t) - 1) * length(t) + calc(t)
end
