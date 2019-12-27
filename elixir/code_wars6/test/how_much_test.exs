defmodule HowMuchTest do
  use ExUnit.Case

  def testing(numtest, m, n, ans) do
    IO.puts("Test #{numtest}")
    assert HowMuch.howmuch(m, n) == ans
  end

  test "howmuch" do
    testing(1, 1, 100, [["M: 37", "B: 5", "C: 4"], ["M: 100", "B: 14", "C: 11"]])
    testing(6, 2950, 2950, [])

    testing(7, 20000, 20100, [
      ["M: 20008", "B: 2858", "C: 2223"],
      ["M: 20071", "B: 2867", "C: 2230"]
    ])
  end
end
