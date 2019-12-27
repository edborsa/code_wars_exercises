defmodule PolydivisableNumbers do
  @codex '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'

  def is_polydivisible(s, b) do
    String.to_charlist(s)
    |> Enum.zip(1..9999)
    |> Enum.reduce_while(0, fn {d, i}, pn ->
      z = pn * b + Enum.find_index(@codex, &(&1 == d))
      if rem(z, i) == 0, do: {:cont, z}, else: {:halt, nil}
    end)
    |> is_number()
  end

  def get_polydivisible(1, _), do: "0"
  def get_polydivisible(n, b), do: ix(n - 1, b, 0)

  defp ix(0, b, q), do: from_b10(q, b, "")

  defp ix(n, b, q) do
    v = is_polydivisible(from_b10(q + 1, b, ""), b)
    if v, do: ix(n - 1, b, q + 1), else: ix(n, b, q + 1)
  end

  defp from_b10(0, _, s), do: s
  defp from_b10(n, b, s), do: from_b10(div(n, b), b, <<Enum.at(@codex, rem(n, b))>> <> s)
end
