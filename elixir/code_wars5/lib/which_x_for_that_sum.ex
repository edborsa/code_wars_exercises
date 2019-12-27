defmodule WhichXForThatSum do
  def solve(m) do
    (2 * m - :math.sqrt(4 * m + 1) + 1) / (2 * m)
  end
end
