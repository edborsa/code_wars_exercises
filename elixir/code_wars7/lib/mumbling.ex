defmodule Mumbling do
  def accum(s) do
    s
    |> String.graphemes()
    |> Enum.reduce({[], 1}, fn x, {acc, times} ->
      {[String.duplicate(x, times) |> String.capitalize() | acc], times + 1}
    end)
    |> elem(0)
    |> Enum.reverse()
    |> Enum.join("-")
  end
end
