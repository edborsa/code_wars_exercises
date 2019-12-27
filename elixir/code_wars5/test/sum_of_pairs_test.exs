# TODO: Replace examples and use TDD development by writing your own tests

defmodule SumOfPairsTest do
  use ExUnit.Case

  import SumOfPairs, only: [sum_pairs: 2]

  test "Basic" do
    assert sum_pairs([1, 4, 8, 7, 3, 15], 8) == {1, 7}
  end

  test "Negatives" do
    assert sum_pairs([1, -2, 3, 0, -6, 1], -6) == {0, -6}
  end

  test "No Match" do
    assert sum_pairs([20, -13, 40], -7) == nil
  end

  test "First Match From Left" do
    assert sum_pairs([1, 2, 3, 4, 1, 0], 2) == {1, 1}
  end

  test "First Match From Left REDUX!" do
    assert sum_pairs([10, 5, 2, 3, 7, 5], 10) == {3, 7}
  end

  test "Duplicates" do
    assert sum_pairs([4, -2, 3, 3, 4], 8) == {4, 4}
  end

  test "Zeroes" do
    assert sum_pairs([0, 2, 0], 0) == {0, 0}
  end

  test "Subtraction" do
    assert sum_pairs([5, 9, 13, -3], 10) == {13, -3}
  end
end
