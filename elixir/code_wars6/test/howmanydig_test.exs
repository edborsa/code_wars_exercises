defmodule HowmanydigTest do
  use ExUnit.Case

  def testing(numtest, n, d, ans) do
    IO.puts("Test #{numtest}")
    assert Howmanydig.sel_number(n, d) == ans
  end

  test "max_sum_dig" do
    testing(1, 0, 1, 0)
    testing(2, 3, 1, 0)
    testing(3, 13, 1, 1)
    testing(4, 15, 1, 1)
    testing(5, 20, 2, 2)
  end
end
