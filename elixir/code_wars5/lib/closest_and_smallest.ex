defmodule ClosestAndSmallest do
  defp helper([]), do: [{}, {}]

  defp helper(ls),
    do:
      ls
      |> Enum.with_index()
      |> Enum.map(fn {s, i} ->
        n = String.to_integer(s)
        {n |> Integer.digits() |> Enum.sum(), i, n}
      end)
      |> Enum.sort()
      |> Enum.chunk_every(2, 1, :discard)
      |> Enum.min_by(fn [{a, i, _}, {b, j, _}] -> {b - a, a, min(i, j)} end)

  def closest(s), do: s |> String.split() |> helper
end
