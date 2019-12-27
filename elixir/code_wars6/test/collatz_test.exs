defmodule CollatzTest do
  use ExUnit.Case

  test "a few basic test cases" do
    assert Collatz.collatz(1) == "1"
    assert Collatz.collatz(2) == "2->1"
    assert Collatz.collatz(3) == "3->10->5->16->8->4->2->1"
    assert Collatz.collatz(4) == "4->2->1"
  end
end
