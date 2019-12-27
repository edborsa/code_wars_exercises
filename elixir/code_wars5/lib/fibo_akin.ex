defmodule Fibkind do
  def length_sup_u_k(n, k) do
    gen(n)
    |> Enum.count(fn {_, v} -> v >= k end)
  end

  def comp(n) do
    u = gen(n)

    for i <- 2..n,
        u[i] < u[i - 1] do
      n
    end
    |> length
  end

  def gen(n) do
    gen(%{1 => 1, 2 => 1}, 3, n)
  end

  def gen(u, n, maxn) when n > maxn, do: u

  def gen(u, n, maxn) do
    gen(Map.put(u, n, u[n - u[n - 1]] + u[n - u[n - 2]]), n + 1, maxn)
  end
end
