defmodule YesOrNoTest do
  use ExUnit.Case

  alias YesOrNo

  test "some test description" do
    assert YesOrNo.boolToWord(true) == "Yes"
    assert YesOrNo.boolToWord(false) == "No"
  end
end
