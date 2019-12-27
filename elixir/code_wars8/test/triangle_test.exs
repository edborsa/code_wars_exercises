# TODO: Replace examples and use TDD development by writing your own tests

defmodule TestSolution do
  use ExUnit.Case
  import Triangle, only: [other_angle: 2]

  test "other_angle" do
    assert other_angle(30, 60) == 90
    assert other_angle(60, 60) == 60
    assert other_angle(43, 78) == 59
    assert other_angle(10, 20) == 150
  end
end
