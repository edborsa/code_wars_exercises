defmodule FactorialDecomposition do
  def decomp(n) do
    n
    |> factorial
    |> Enum.map(&multiples/1)
    |> List.flatten()
    |> Enum.reduce(%{}, fn x, acc -> Map.update(acc, x, 1, &(&1 + 1)) end)
    |> Enum.into([])
    |> Enum.sort_by(fn {a, _} -> a end)
    |> Enum.map(&tuple_to_string/1)
    |> Enum.join(" * ")
  end

  def tuple_to_string({a, 1}), do: "#{a}"
  def tuple_to_string({a, b}), do: "#{a}^#{b}"

  def factorial(n), do: for(x <- 2..n, do: x)

  def multiples(num) do
    multiples(num, 2, [])
  end

  defp multiples(num, div, acc) when div > num, do: Enum.reverse(acc)

  defp multiples(num, div, acc) do
    if rem(num, div) == 0 do
      multiples(div(num, div), div, [div | acc])
    else
      multiples(num, div + 1, acc)
    end
  end
end
