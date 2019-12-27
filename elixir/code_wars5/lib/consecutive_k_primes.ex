defmodule ConsecutiveKPrimes do
  def consec_Kprimes(k, list) do
    Enum.map(list, &(length(multiples(&1)) == k))
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.reduce(0, fn [a, b], acc -> if a and b, do: acc + 1, else: acc end)
  end

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
