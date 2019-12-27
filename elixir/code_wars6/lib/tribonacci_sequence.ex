defmodule TribonacciSequence do
  @spec tribonacci({number, number, number}, non_neg_integer) :: [number]
  def tribonacci({t0, t1, t2} = signature, num_elements) do
    tribonacci(signature, num_elements, [t2, t1, t0])
  end

  def tribonacci(_not_triple, _) do
    {:error, "Not Tripple"}
  end

  defp tribonacci(signature, n, acc) when n < 3, do: acc |> Enum.take(-n)
  defp tribonacci(signature, 3, acc), do: acc |> Enum.reverse()

  defp tribonacci({t0, t1, t2}, num_elements, acc) do
    t_new = t0 + t1 + t2
    tribonacci({t1, t2, t_new}, num_elements - 1, [t_new | acc])
  end
end

# @spec tribonacci({number, number, number}, non_neg_integer) :: [number]
#   def tribonacci(signature, n) do
#     signature
#     |> Stream.unfold(fn {a, b, c} -> {a, {b, c, a+b+c}} end)
#     |> Enum.take(n)
#   end
