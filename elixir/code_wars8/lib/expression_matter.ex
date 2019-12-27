defmodule ExpressionMatter do
  def expression_matter(a, b, c) do
    Enum.max([
      a + b + c,
      a * b * c,
      a + b * c,
      a * (b + c),
      (a + b) * c,
      a * b + c
    ])
  end
end
