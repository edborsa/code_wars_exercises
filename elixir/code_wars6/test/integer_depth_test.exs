defmodule IntegerDepthTest do
  use ExUnit.Case
  import IntegerDepth

  test "Example tests" do
    assert compute_depth(1) == 10
    assert compute_depth(42) == 9
    assert compute_depth(25) == 36
  end
end
