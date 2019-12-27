defmodule TwoSumTest do
  use ExUnit.Case

  test "basic tests" do
    assert TwoSum.two_sum([1, 2, 3], 4) in [{0, 2}, {2, 0}]
    assert TwoSum.two_sum([1234, 5678, 9012], 14690) in [{1, 2}, {2, 1}]
    assert TwoSum.two_sum([2, 2, 4], 4) in [{0, 1}, {1, 0}]
  end
end
