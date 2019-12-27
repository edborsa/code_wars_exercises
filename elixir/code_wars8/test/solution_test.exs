defmodule TestSolution do
  use ExUnit.Case

  test "basic cases" do
    assert Solution.solution([[]]) == []
    assert Solution.solution([[1]]) == [1]
    assert Solution.solution([[1, 2]]) == [1, 2]
    assert Solution.solution([[], []]) == []
    assert Solution.solution([[], [1]]) == [1]
    assert Solution.solution([[1], [2]]) == [1, 2]
  end

  test "more advanced cases" do
    assert Solution.solution([[10, -10], [0]]) == [-10, 0, 10]
    assert Solution.solution([[4, 3, 2, 1]]) == [1, 2, 3, 4]
    assert Solution.solution([[4, 3], [1, 2]]) == [1, 2, 3, 4]
    assert Solution.solution([[], [1], [], [3, 2]]) == [1, 2, 3]
  end
end
