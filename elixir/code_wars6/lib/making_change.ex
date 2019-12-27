defmodule MakingChange do
  def make_change(0), do: %{}
  def make_change(amount) when amount >= 50, do: merge(%{H: 1}, make_change(amount - 50))
  def make_change(amount) when amount >= 25, do: merge(%{Q: 1}, make_change(amount - 25))
  def make_change(amount) when amount >= 10, do: merge(%{D: 1}, make_change(amount - 10))
  def make_change(amount) when amount >= 5, do: merge(%{N: 1}, make_change(amount - 5))
  def make_change(amount) when amount >= 1, do: merge(%{P: 1}, make_change(amount - 1))

  defp merge(map1, map2) do
    Map.merge(map1, map2, fn _, value1, value2 -> value1 + value2 end)
  end
end
