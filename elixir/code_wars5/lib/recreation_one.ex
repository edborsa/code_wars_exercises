defmodule RecreationOne do
  def list_squared(m, n) do
    m..n
    |> Enum.map(&{&1, getSumOfSquaresOfFactors(&1)})
    |> Enum.filter(fn {_, sos} ->
      r = :math.sqrt(sos)
      r - trunc(r) == 0
    end)
  end

  def getSumOfSquaresOfFactors(num) do
    1..(:math.sqrt(num) |> trunc)
    |> Enum.filter(&(rem(num, &1) == 0))
    |> Enum.reduce(0, fn x, acc ->
      r = div(num, x)
      if x == r, do: acc + x * x, else: acc + x * x + r * r
    end)
  end
end
