defmodule ReturnTheFirstMMultiplesOfN do
  def multiples(m, n) do
    Stream.iterate(n, &(&1 + n)) |> Enum.take(m)
  end
end
