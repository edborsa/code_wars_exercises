defmodule StringRepeatTest do
  use ExUnit.Case

  import StringRepeat

  test "Basic tests" do
    assert repeat_str(3, "*") == "***"
    assert repeat_str(5, "#") == "#####"
    assert repeat_str(2, "ha ") == "ha ha "
  end
end
