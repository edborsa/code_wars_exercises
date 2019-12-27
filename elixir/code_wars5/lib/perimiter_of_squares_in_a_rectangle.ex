defmodule PerimiterOfSquaresInARectangle do
  def perimeter(n) do
    fibonacci_sequence(n + 1)
    |> Enum.reduce(0, &+/2)
    |> Kernel.*(4)
  end

  defp fibonacci_sequence(n) do
    Stream.unfold({1, 1}, fn {acc, n} -> {acc, {n, acc + n}} end)
    |> Enum.take(n)
  end
end
