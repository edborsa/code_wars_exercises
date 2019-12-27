defmodule FindTheOddIntTest do
  use ExUnit.Case

  alias FindTheOddInt

  test "basic cases" do
    assert FindTheOddInt.find([20, 1, -1, 2, -2, 3, 3, 5, 5, 1, 2, 4, 20, 4, -1, -2, 5]) == 5
    assert FindTheOddInt.find([1, 1, 2, -2, 5, 2, 4, 4, -1, -2, 5]) == -1
    assert FindTheOddInt.find([20, 1, 1, 2, 2, 3, 3, 5, 5, 4, 20, 4, 5]) == 5
    assert FindTheOddInt.find([10]) == 10
    assert FindTheOddInt.find([1, 1, 1, 1, 1, 1, 10, 1, 1, 1, 1]) == 10
    assert FindTheOddInt.find([5, 4, 3, 2, 1, 5, 4, 3, 2, 10, 10]) == 1
  end
end
