defmodule SumIntervalsTest do
  use ExUnit.Case

  defp testing(a, exp) do
    act = SumIntervals.sum_of_intervals(a)

    assert act == exp, """
    Given list #{inspect(a, charlists: :as_lists)}
    Expected #{exp}, got #{act}
    """
  end

  test "basic tests" do
    testing([{1, 5}], 4)
    testing([{1, 5}, {6, 10}], 8)
    testing([{1, 5}, {1, 5}], 4)
    testing([{1, 4}, {7, 10}, {3, 5}], 7)
  end
end
