defmodule Howmanydig do
  def sel_number(n, d) when n < 12 do
    0
  end

  def sel_number(n, d) do
    sel_number(12, n, d, 0)
  end

  def sel_number(top, top, _diff, acc), do: acc

  def sel_number(current, top, diff, acc) do
    cond do
      valid?(current, diff) ->
        sel_number(current + 1, top, diff, acc + 1)

      true ->
        sel_number(current + 1, top, diff, acc)
    end
  end

  def valid?(num, diff) do
    Integer.digits(num)
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.map(fn [f, s] -> s - f end)
    |> Enum.all?(&(&1 <= diff))
  end
end
