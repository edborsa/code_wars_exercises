defmodule Summation do
  def summation(n) do
    summation(0, n)
  end

  def summation(acc, 0), do: acc

  def summation(acc, n) do
    summation(acc + n, n - 1)
  end
end
