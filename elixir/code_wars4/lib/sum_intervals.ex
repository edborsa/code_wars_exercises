defmodule SumIntervals do
  def sum_of_intervals(array) do
    array
    |> Enum.reduce([], fn {b, e}, acc ->
      b..(e - 1)
      |> Enum.map(fn x -> x end)
      |> Enum.concat(acc)
    end)
    |> Enum.uniq()
    |> Kernel.length()
  end
end
