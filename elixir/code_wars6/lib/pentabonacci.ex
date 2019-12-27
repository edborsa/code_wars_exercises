defmodule Pentabonacci do
  def count_odd_pentaFib(n) do
    div(n, 6) * 2 - 1 + min(2, rem(n, 6))
  end
end
