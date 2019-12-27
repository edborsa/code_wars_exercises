defmodule FindTheParityOutlierTest do
  use ExUnit.Case

  alias FindTheParityOutlier

  test "Sample tests" do
    assert FindTheParityOutlier.find_outlier([0, 1, 2]) == 1
    assert FindTheParityOutlier.find_outlier([1, 2, 3]) == 2
    assert FindTheParityOutlier.find_outlier([2, 6, 8, 10, 3]) == 3
    assert FindTheParityOutlier.find_outlier([0, 0, 3, 0, 0]) == 3
    assert FindTheParityOutlier.find_outlier([1, 1, 0, 1, 1]) == 0
  end
end
