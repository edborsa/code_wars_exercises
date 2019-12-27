defmodule BuddyPairs do
  def buddy(start, nd) do
    n = start
    m = Enum.sum(divisors(n)) - 1

    cond do
      start > nd -> "Nothing"
      m >= n and n == Enum.sum(divisors(m)) - 1 -> "#{n} #{m}"
      true -> buddy(start + 1, nd)
    end
  end

  def divisors(0) do
    []
  end

  def divisors(1) do
    [1]
  end

  def divisors(x) do
    sqrt = :math.sqrt(x) |> ceil
    divs = 2..sqrt |> Enum.filter(fn i -> rem(x, i) == 0 end)

    ([1] ++ divs ++ Enum.map(divs, fn i -> floor(x / i) end))
    |> Enum.uniq()
  end
end
