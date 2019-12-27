defmodule BackspaceInStringTest do
  use ExUnit.Case

  test "Sample tests" do
    assert BackspaceInString.clean_string("abjd####jfk#") == "jf"
    # assert BackspaceInString.clean_string("abc####d##c#") == ""
    # assert BackspaceInString.clean_string("#######") == ""
    # assert BackspaceInString.clean_string("") == ""
  end
end
