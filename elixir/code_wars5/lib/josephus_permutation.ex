defmodule JosephusPermutation do
  def permutation(items, k) do
    permutation(items, k, k)
  end

  def permutation([], _current, _k), do: []

  def permutation([head | tail], 1, k) do
    [head | permutation(tail, k, k)]
  end

  def permutation([head | tail], current, k) do
    permutation(tail ++ [head], current - 1, k)
  end
end
