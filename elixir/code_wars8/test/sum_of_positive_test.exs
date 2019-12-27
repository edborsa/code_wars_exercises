defmodule SumOfPositiveTest do
  use ExUnit.Case
  import SumOfPositive, only: [positive_sum: 1]

  test "works for basic cases" do
    assert positive_sum([1, 2, 3, 4, 5]) == 15
    assert positive_sum([1, -2, 3, 4, 5]) == 13
    assert positive_sum([-1, 2, 3, 4, -5]) == 9
  end
end
