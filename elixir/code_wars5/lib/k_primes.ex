defmodule KPrimes do
  def count_Kprimes(k, start, nd) do
    start..nd
    |> Enum.filter(&is_prime?(&1, k, 2))
  end

  def puzzle(s) do
    a = count_Kprimes(1, 0, s)
    b = count_Kprimes(3, 0, s)
    c = count_Kprimes(7, 0, s)
    r = for x <- a, y <- b, z <- c, x + y + z == s, do: [x, y, z]
    length(r)
  end

  def is_prime?(0, _, _), do: false

  def is_prime?(n, k, i) do
    cond do
      k == 0 and n == 1 ->
        true

      n == 1 ->
        false

      rem(n, i) == 0 ->
        is_prime?(div(n, i), k - 1, i)

      true ->
        is_prime?(n, k, i + 1)
    end
  end
end
