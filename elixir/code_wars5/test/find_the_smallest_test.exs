defmodule FindTheSmallestTest do
  use ExUnit.Case

  def dotest(numtest, n, ans) do
    IO.puts("Test #{numtest}")
    assert FindTheSmallest.smallest(n) == ans
  end

  test "smallest" do
    dotest(1, 261_235, [126_235, 2, 0])
    dotest(2, 209_917, [29917, 0, 1])
    dotest(3, 285_365, [238_565, 3, 1])
    dotest(4, 269_045, [26945, 3, 0])
    dotest(5, 296_837, [239_687, 4, 1])
  end
end
