defmodule DirectionsReduction do
  def reduce(directions) do
    directions
    |> Enum.reduce(
      [],
      fn
        x, [] ->
          [x]

        x, acc ->
          [head_acc | t] = acc

          if should_discard?([head_acc, x]) do
            t
          else
            [x | acc]
          end
      end
    )
    |> Enum.reverse()
  end

  def should_discard?(["NORTH", "SOUTH"]), do: true
  def should_discard?(["SOUTH", "NORTH"]), do: true
  def should_discard?(["EAST", "WEST"]), do: true
  def should_discard?(["WEST", "EAST"]), do: true
  def should_discard?(_), do: false
end
