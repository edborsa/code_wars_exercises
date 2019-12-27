defmodule BestSumTest do
  use ExUnit.Case

  def dotest(t, k, ls, exp) do
    IO.puts("Testing : #{t} #{k}")
    IO.inspect(ls, charlists: :as_lists)
    act = BestSum.best_sum(t, k, ls)
    IO.inspect("act: #{act}")
    IO.inspect("exp: #{exp}")
    assert act == exp
    IO.puts("#")
  end

  test "best_sum" do
    ts = [50, 55, 56, 57, 58]
    dotest(163, 3, ts, 163)
    ts = [91, 74, 73, 85, 73, 81, 87]
    dotest(230, 3, ts, 228)
    dotest(331, 2, ts, 178)
    dotest(331, 4, ts, 331)
  end
end
