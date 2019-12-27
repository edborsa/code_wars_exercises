defmodule SnailTest do
  use ExUnit.Case

  test "3x3 positions" do
    matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]

    assert Snail.snail(matrix) == [1, 2, 3, 6, 9, 8, 7, 4, 5]
  end

  test "3x3 order" do
    matrix = [[1, 2, 3], [8, 9, 4], [7, 6, 5]]

    assert Snail.snail(matrix) == [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  test "4x4 order" do
    matrix = [[1, 2, 3, 4], [12, 13, 14, 5], [11, 16, 15, 6], [10, 9, 8, 7]]

    assert Snail.snail(matrix) == 1..16 |> Enum.map(fn x -> x end)
  end

  test "5x5 order" do
    matrix = [
      [1, 2, 3, 4, 5],
      [16, 17, 18, 19, 6],
      [15, 24, 25, 20, 7],
      [14, 23, 22, 21, 8],
      [13, 12, 11, 10, 9]
    ]

    assert Snail.snail(matrix) == 1..25 |> Enum.map(fn x -> x end)

    matrix = [
      [1, 2, 3, 4, 5],
      [6, 7, 8, 9, 10],
      [11, 12, 13, 14, 15],
      [16, 17, 18, 19, 20],
      [21, 22, 23, 24, 25]
    ]

    assert Snail.snail(matrix) == [
             1,
             2,
             3,
             4,
             5,
             10,
             15,
             20,
             25,
             24,
             23,
             22,
             21,
             16,
             11,
             6,
             7,
             8,
             9,
             14,
             19,
             18,
             17,
             12,
             13
           ]
  end

  test "6x6 order" do
    matrix = [
      [1, 2, 3, 4, 5, 6],
      [20, 21, 22, 23, 24, 7],
      [19, 32, 33, 34, 25, 8],
      [18, 31, 36, 35, 26, 9],
      [17, 30, 29, 28, 27, 10],
      [16, 15, 14, 13, 12, 11]
    ]

    assert Snail.snail(matrix) == 1..36 |> Enum.map(fn x -> x end)
  end
end
