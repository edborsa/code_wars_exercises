defmodule ProductOfConsecutiveFibNumbers do
  def product_fib(n, a \\ 0, b \\ 1)
  def product_fib(n, a, b) when n <= a * b, do: [a, b, n == a * b]
  def product_fib(n, a, b), do: n |> product_fib(b, a + b)
end
