defmodule Collatz do
  # def collatz(n) do
  #   collatz(n, [])
  # end
  #
  # def collatz(1, acc) do
  #   ans =
  #     acc
  #     |> Enum.reverse()
  #     |> Enum.into("", fn x -> Integer.to_string(x) <> "->" end)
  #
  #   ans <> "1"
  # end
  #
  # def collatz(n, acc) do
  #   cond do
  #     rem(n, 2) == 0 ->
  #       collatz(trunc(n / 2), [n | acc])
  #
  #     true ->
  #       collatz(3 * n + 1, [n | acc])
  #   end
  # end
  defguard is_even(value) when is_integer(value) and rem(value, 2) == 0
  defguard is_odd(value) when is_integer(value) and rem(value, 2) == 1
  def collatz(1), do: "1"
  def collatz(n) when is_odd(n), do: Integer.to_string(n) <> "->" <> collatz(3 * n + 1)
  def collatz(n) when is_even(n), do: Integer.to_string(n) <> "->" <> collatz(div(n, 2))
end
