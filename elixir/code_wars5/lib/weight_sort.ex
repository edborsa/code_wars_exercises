defmodule WeightSort do
  def weight(""), do: ""

  def weight(str) do
    str
    |> String.split(" ")
    |> Enum.map(fn x ->
      [x, String.to_integer(x) |> Integer.digits() |> Enum.sum()]
    end)
    |> Enum.sort(&(List.last(&1) <= List.last(&2)))
    |> Enum.group_by(fn [_, x] -> x end)
    |> Map.to_list()
    |> Enum.map(fn {_, x} -> x end)
    |> Enum.map(fn x ->
      Enum.sort(x, &(List.first(&1) <= List.first(&2)))
    end)
    |> Enum.reduce([], fn x, acc ->
      Enum.concat(acc, x)
    end)
    |> Enum.map(fn [x, _] -> x end)
    |> Enum.reduce_while("", fn
      x, "" -> {:cont, x}
      x, acc -> {:cont, acc <> " " <> x}
      [], acc -> {:halt, acc}
    end)
  end
end

#  def weight(str) do
#     str
#     |> String.split()
#     |> Enum.sort()
#     |> Enum.sort_by(&_weight/1)
#     |> Enum.join(" ")
#   end
#
#   def _weight(str) do
#     str
#     |> String.to_integer()
#     |> Integer.digits()
#     |> Enum.sum()
#   end
