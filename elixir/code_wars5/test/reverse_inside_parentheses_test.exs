defmodule ReverseInsideParenthesesTest do
  use ExUnit.Case

  test "Static tests" do
    assert Kata.reverse_in_parens("h(el)lo") == "h(le)lo"
    assert Kata.reverse_in_parens("a ((d e) c b)") == "a (b c (d e))"
    assert Kata.reverse_in_parens("one (two (three) four)") == "one (ruof (three) owt)"
    assert Kata.reverse_in_parens("one (ruof ((rht)ee) owt)") == "one (two ((thr)ee) four)"
  end
end
