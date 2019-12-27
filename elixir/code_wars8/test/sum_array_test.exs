defmodule SumArrayTest do
  use ExUnit.Case

  test "sum_array/1" do
    assert CodeWars8.SumArray.sum([1, 5.2, 0, 4]) == 10.2
  end
end
