defmodule MultiplesOf352 do
  def solution(number) do
    1..(number - 1)
    |> Enum.filter(fn x ->
      rem(x, 3) == 0 || rem(x, 5) == 0
    end)
    |> Enum.sum()
  end
end
