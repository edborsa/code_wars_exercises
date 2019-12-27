defmodule TheMilionthFib do
end

defmodule Fib do
  defp aux(n) when n == 0, do: [0, 1]
  defp aux(n) when n == 1, do: [1, 1]

  defp aux(n) do
    [a, b] = aux(div(n, 2))
    x = a * (2 * b - a)
    y = b * b + a * a

    cond do
      rem(n, 2) == 0 -> [x, y]
      true -> [y, y + x]
    end
  end

  def fib(n) when n >= 0, do: Enum.at(aux(n), 0)
  def fib(n) when rem(n, 2) == 0, do: -Enum.at(aux(-n), 0)
  def fib(n), do: Enum.at(aux(-n), 0)
end

defmodule Fib do
  require Integer

  def fib(n) do
    cond do
      n < 0 and Integer.is_even(n) -> -fib_iter(1, 0, 0, 1, -n)
      n < 0 and Integer.is_odd(n) -> fib_iter(1, 0, 0, 1, -n)
      true -> fib_iter(1, 0, 0, 1, n)
    end
  end

  def fib_iter(a, b, p, q, count) do
    cond do
      count == 0 -> b
      Integer.is_even(count) -> fib_iter(a, b, p * p + q * q, q * q + 2 * p * q, div(count, 2))
      true -> fib_iter(a * q + b * q + a * p, b * p + a * q, p, q, count - 1)
    end
  end
end

defmodule Fib do
  def fib(num) when num < 0 do
    num = -num
    if rem(num, 2) == 0, do: -fib(num), else: fib(num)
  end

  def fib(num) do
    [a, _] = do_fib(num)
    a
  end

  def do_fib(0), do: [0, 1]
  def do_fib(1), do: [1, 1]

  def do_fib(num) do
    [a, b] = do_fib(div(num, 2))
    p = a * (2 * b - a)
    q = b * b + a * a
    if rem(num, 2) == 0, do: [p, q], else: [q, p + q]
  end
end

defmodule Fib do
  def fib(n) do
    {result, _} = ffib(n)
    if rem(n, 2) == 0 and n < 0, do: -result, else: result
  end

  def ffib(0), do: {0, 1}

  def ffib(n) do
    {a, b} = ffib(div(n, 2))
    c = a * (b * 2 - a)
    d = a * a + b * b
    if rem(n, 2) == 0, do: {c, d}, else: {d, c + d}
  end
end
