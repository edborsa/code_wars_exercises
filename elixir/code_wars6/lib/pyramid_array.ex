defmodule PyramidArray do
  def pyramid(n) do
    pyramid(n, [])
  end

  def pyramid(0, acc), do: acc

  def pyramid(n, acc) do
    (n - 1)
    |> pyramid([
      String.duplicate("1", n)
      |> String.graphemes()
      |> Enum.map(&String.to_integer(&1))
      | acc
    ])
  end

  def bla() do
    for x <- 1..5, y <- 5..10 do
      Integer.to_string(x) <> "-" <> Integer.to_string(y)
    end
  end
end
