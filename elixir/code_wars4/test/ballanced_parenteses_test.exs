defmodule BallancedParentesesTest do
  use ExUnit.Case

  def solution_check(n, r) do
    user = BallancedParenteses.balanced_parens(n)
    assert Enum.sort(user) == Enum.sort(r)
  end

  test "0" do
    solution_check(0, [""])
  end

  test "1" do
    solution_check(1, ["()"])
  end

  test "2" do
    solution_check(2, ["(())", "()()"])
  end

  test "3" do
    solution_check(3, ["((()))", "(()())", "(())()", "()(())", "()()()"])
  end

  test "4" do
    solution_check(4, [
      "(((())))",
      "((()()))",
      "((())())",
      "((()))()",
      "(()(()))",
      "(()()())",
      "(()())()",
      "(())(())",
      "(())()()",
      "()((()))",
      "()(()())",
      "()(())()",
      "()()(())",
      "()()()()"
    ])
  end
end
