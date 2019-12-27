defmodule SummationTest do
  use ExUnit.Case

  import Summation, only: [summation: 1]

  test "returns the correct total" do
    assert summation(1) == 1
    assert summation(8) == 36
  end
end
