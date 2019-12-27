defmodule SumByFactors do
  def sum_of_divided(lst) do
    lst
    |> Enum.map(&factors(&1))
    |> List.flatten()
    |> Enum.sort()
    |> Enum.uniq()
    |> Enum.reduce([], fn x, acc ->
      rm = lst |> Enum.filter(&(rem(&1, x) == 0))
      if length(rm) > 0, do: [{x, Enum.sum(rm)} | acc], else: acc
    end)
    |> Enum.reverse()
  end

  def factors(n), do: factors(abs(n), 2, [])
  def factors(n, k, f) when k * k > n, do: [n | f]
  def factors(n, k, f) when rem(n, k) == 0, do: factors(div(n, k), k, [k | f])
  def factors(n, k, f), do: factors(n, k + 1, f)
end
