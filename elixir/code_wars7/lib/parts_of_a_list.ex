defmodule PartsOfAList do
  def part_list(a) do
    Enum.map(1..(length(a) - 1), fn n ->
      Enum.split(a, n)
      |> Tuple.to_list()
      |> Enum.map(&Enum.join(&1, " "))
    end)
  end
end
