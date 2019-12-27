defmodule StrongEvenInIntervalTest do
  use ExUnit.Case

  test "number strengths" do
    assert StrongEvenInInterval.strength(12) == 2
    assert StrongEvenInInterval.strength(16) == 4
  end

  test "Example Tests" do
    example_tests = [
      {1, 2, 2},
      {5, 10, 8},
      {48, 56, 48},
      {129, 193, 192}
    ]

    for {n, m, sol} <- example_tests, do: assert(StrongestEvenNumber.strongest_even(n, m) == sol)
  end
end
