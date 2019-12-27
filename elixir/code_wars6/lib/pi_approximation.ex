defmodule PiApproximation do
  def iter_pi(epsilon), do: iter_pi(epsilon, 0, 0)

  def iter_pi(eps, iter, res) do
    if abs(4 * res - :math.pi()) < eps do
      [iter, trunc(res * 4 * :math.pow(10, 10)) / :math.pow(10, 10)]
    else
      iter_pi(eps, iter + 1, res + nth_elem(iter))
    end
  end

  def nth_elem(0), do: 1
  def nth_elem(n), do: :math.pow(-1, n) * 1 / (2 * n + 1)
end
