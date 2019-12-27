defmodule HowManyNumbers do
  def sel_number(n, d) when n < 12 or d < 1, do: 0

  def sel_number(n, d),
    do:
      Enum.count(
        12..n,
        &(Integer.digits(&1)
          |> Enum.chunk_every(2, 1, :discard)
          |> Enum.all?(fn [a, b] -> (b - a) in 1..d end))
      )
end
