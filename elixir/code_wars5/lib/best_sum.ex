defmodule BestSum do
  defp comb(0, _), do: [[]]
  defp comb(_, []), do: []

  defp comb(m, [h | t]) do
    for(l <- comb(m - 1, t), do: [h | l]) ++ comb(m, t)
  end

  def best_sum(t, k, ls) do
    a =
      comb(k, ls)
      |> Enum.map(fn x -> Enum.sum(x) end)
      |> Enum.filter(fn x -> x <= t end)

    if a == [] do
      nil
    else
      Enum.max(a)
    end
  end
end
