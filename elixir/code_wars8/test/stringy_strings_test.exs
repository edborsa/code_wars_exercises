defmodule StringyStringsTest do
  use ExUnit.Case
  import StringyStrings, only: [stringy: 1]

  test "basic cases" do
    assert stringy(3) == "101"
    assert stringy(5) == "10101"
    assert stringy(12) == "101010101010"
    assert stringy(26) == "10101010101010101010101010"
    assert stringy(28) == "1010101010101010101010101010"
  end
end
