defmodule ClockwiseSpiral do
  def create_spiral(n) when n <= 0, do: []
  def create_spiral(n), do: create_spiral([[n * n]], n * n - 1)

  defp create_spiral(spiral, 0), do: spiral

  defp create_spiral(spiral, n) do
    spiral
    |> rotate_cw()
    |> add_row(n)
    |> create_spiral(n - length(spiral))
  end

  defp add_row([row | _] = spiral, n) do
    [
      n..0
      |> Stream.take(length(row))
      |> Enum.reverse()
      | spiral
    ]
  end

  defp rotate_cw(spiral) do
    spiral
    |> Enum.zip()
    |> Enum.map(&(Tuple.to_list(&1) |> Enum.reverse()))
  end
end
