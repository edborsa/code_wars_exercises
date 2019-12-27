defmodule TestParenthesesValidator do
  use ExUnit.Case
  import ParenthesesValidator, only: [valid_parentheses: 1]

  test "valid_parentheses" do
    assert valid_parentheses("") == true
    assert valid_parentheses("()") == true
    assert valid_parentheses(")(()))") == false
    assert valid_parentheses("(") == false
    assert valid_parentheses("(())((()())())") == true
    assert valid_parentheses("hi)(") == false
  end
end
