defmodule PandigitalSequence do
  def get_sequence(offset, size) when offset <= 9_876_543_210 do
    max(offset, 1_023_456_789)..9_876_543_210
    |> Stream.filter(fn elem -> MapSet.size(MapSet.new(Integer.digits(elem))) == 10 end)
    |> Stream.take(size)
    |> Enum.to_list()
  end

  def get_sequence(offset, _size) when offset > 9_876_543_210, do: []
end
