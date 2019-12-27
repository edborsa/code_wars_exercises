defmodule TestSolution do
  use ExUnit.Case
  import TM

  test "basic tests" do
    assert thue(1) == "0"
    assert thue(2) == "01"
    assert thue(5) == "01101"
    assert thue(8) == "01101001"
  end
end
