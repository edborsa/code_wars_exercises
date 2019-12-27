defmodule RightTruncableHarshadNumbers do
  def rthn_between(_, n2) when n2 < 10, do: []
  def rthn_between(n1, n2), do: forge(Enum.zip(1..9, 1..9), n1, n2)

  defp forge([{n, _} | _], _, nd) when n > nd, do: []

  defp forge(r, st, nd) do
    r2 = ix(r)
    for({n, _} <- r2, n >= st && n <= nd, do: n) ++ forge(r2, st, nd)
  end

  defp ix([]), do: []

  defp ix([{n, sum} | r]),
    do: for(q <- 0..9, rem(n * 10 + q, sum + q) == 0, do: {n * 10 + q, sum + q}) ++ ix(r)
end
