defmodule NumPrimorial do
  def numPrimorial(1), do: 2

  def numPrimorial(num) do
    numPrimorial(num, 2, 3)
  end

  def numPrimorial(1, acc, _current), do: acc

  def numPrimorial(num, acc, current) do
    cond do
      is_prime(current) ->
        numPrimorial(num - 1, acc * current, current + 1)

      true ->
        numPrimorial(num, acc, current + 1)
    end
  end

  def is_prime(x) when x < 1, do: false
  def is_prime(1), do: true

  def is_prime(num), do: is_prime(num, 2)

  def is_prime(num, div) do
    cond do
      num == div ->
        true

      rem(num, div) == 0 ->
        false

      true ->
        is_prime(num, div + 1)
    end
  end
end
