defmodule SumsPartsTest do
  use ExUnit.Case

  def testing(ls, exp) do
    act = SumsParts.parts_sums(ls)
    assert act == exp
  end

  test "parts_sums, fixed tests" do
    testing([1, 2, 3, 4, 5, 6], [21, 20, 18, 15, 11, 6, 0])

    ls = [744_125, 935, 407, 454, 430, 90, 144, 6_710_213, 889, 810, 2_579_358]

    testing(ls, [
      10_037_855,
      9_293_730,
      9_292_795,
      9_292_388,
      9_291_934,
      9_291_504,
      9_291_414,
      9_291_270,
      2_581_057,
      2_580_168,
      2_579_358,
      0
    ])

    testing([], [0])
  end
end
