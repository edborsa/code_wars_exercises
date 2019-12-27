defmodule BackspaceInStringTest do
  use ExUnit.Case

  test "Sample tests" do
    assert BackspaceInString.clean_string("") == ""
    assert BackspaceInString.clean_string("a") == "a"
    assert BackspaceInString.clean_string("ab") == "ab"
    assert BackspaceInString.clean_string("#") == ""
    assert BackspaceInString.clean_string("a#") == ""
    assert BackspaceInString.clean_string("#######") == ""
    assert BackspaceInString.clean_string("abc#d##c") == "ac"
    assert BackspaceInString.clean_string("abc####d##c#") == ""
  end
end
