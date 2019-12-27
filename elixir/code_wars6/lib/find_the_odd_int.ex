defmodule FindTheOddInt do
  def find(list) do
    list
    |> Enum.group_by(& &1)
    |> Enum.map(fn {_key, value} -> value end)
    |> Enum.filter(fn x -> length(x) |> rem(2) == 1 end)
    |> List.first()
    |> List.first()
  end
end
