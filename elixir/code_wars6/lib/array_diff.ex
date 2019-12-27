defmodule ArrayDiff do
  def array_diff(a, []), do: a

  def array_diff(a, [h1 | tail]) do
    Enum.reject(a, &(&1 == h1))
    |> array_diff(tail)
  end
end
