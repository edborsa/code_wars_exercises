defmodule ExpressionsMatterTest do
  use ExUnit.Case

  defp testing(a, b, c, exp) do
    actual = ExpressionMatter.expression_matter(a, b, c)
    assert actual == exp, "Given values: #{a}, #{b}, #{c}. Expected: #{exp}, got: #{actual}"
  end

  test "Fixed tests" do
    testing(2, 1, 2, 6)
    testing(2, 1, 1, 4)
    testing(1, 1, 1, 3)
    testing(1, 2, 3, 9)
    testing(1, 3, 1, 5)
    testing(2, 2, 2, 8)
    testing(5, 1, 3, 20)
    testing(3, 5, 7, 105)
    testing(5, 6, 1, 35)
    testing(1, 6, 1, 8)
    testing(2, 6, 1, 14)
    testing(6, 7, 1, 48)
    testing(2, 10, 3, 60)
    testing(1, 8, 3, 27)
    testing(9, 7, 2, 126)
    testing(1, 1, 10, 20)
    testing(9, 1, 1, 18)
    testing(10, 5, 6, 300)
    testing(1, 10, 1, 12)
  end
end
