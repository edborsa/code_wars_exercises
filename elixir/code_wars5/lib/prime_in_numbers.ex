defmodule PrimeInNumbers do
  def prime_factors(1), do: 1
  def prime_factors(2), do: 2

  def prime_factors(n) do
    prime_factors(n, 2, [])
  end

  def prime_factors(1, _current, acc), do: acc |> Enum.reverse() |> factors_to_string()

  def prime_factors(n, current, acc) do
    cond do
      rem(n, current) == 0 ->
        prime_factors(div(n, current), current, [current | acc])

      true ->
        prime_factors(n, current + 1, acc)
    end
  end

  def factors_to_string(input) do
    uniq = Enum.uniq(input)

    Enum.reduce(uniq, "", fn x, acc ->
      acc <>
        "(" <>
        Integer.to_string(x) <> num_power(input, x) <> ")"
    end)
  end

  def num_power(input, x) do
    input
    |> Enum.count(fn c -> x == c end)
    |> times_in_to_string()
  end

  def times_in_to_string(1) do
    ""
  end

  def times_in_to_string(n) do
    "**" <> Integer.to_string(n)
  end
end
