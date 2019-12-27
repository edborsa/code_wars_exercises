defmodule SumsParts do
  def parts_sums(ls) do
    _parts_sums(ls, [])
  end

  def _parts_sums([], acc), do: Enum.reverse([0 | acc])

  def _parts_sums([h | t] = ls, acc) do
    _parts_sums(t, [Enum.sum(ls) | acc])
  end
end
