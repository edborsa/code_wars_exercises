defmodule GenerateRangeOfIntegers do
  def generate_range(min, max, step) do
    Stream.take_every(min..max, step) |> Enum.to_list()
  end
end
