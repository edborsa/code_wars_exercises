defmodule IsMyFriendCheating do
  def remov_nb(n) do
    total = div(n * (n + 1), 2)

    for x <- 2..n, y = div(total - x, x + 1), rem(total - x, x + 1) == 0 && y < n do
      {x, y}
    end
  end
end
