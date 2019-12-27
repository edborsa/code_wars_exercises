defmodule SumOfPositive do
  def positive_sum(arr) do
    arr
    |> Enum.filter(&(&1 >= 0))
    |> Enum.sum()
  end
end
