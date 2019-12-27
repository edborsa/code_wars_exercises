defmodule Denom do
  def convert_fracts(ls) do
    denominators = Enum.map(ls, fn [_, denominator] -> denominator end)

    denominator_primes = Enum.map(denominators, fn x -> number_to_primes(x) end)
    # gcd = retira(denominator_primes)

    # Enum.map(ls, fn [n, d] -> [trunc(gcd / d * n), gcd] end)
  end

  def retira(listas_de_listas) do
    retira(listas_de_listas, [])
  end

  def retira(listas_de_listas, gcd) do
    cond do
      Enum.filter(listas_de_listas, &(&1 != [])) == [] ->
        Enum.reduce(gcd, 1, fn x, acc -> acc * x end)

      true ->
        valor = first_from_first_list(listas_de_listas)

        listas_de_listas =
          Enum.map(listas_de_listas, fn x ->
            remove_first(x, valor)
          end)

        retira(listas_de_listas, [valor | gcd])
    end
  end

  def number_to_primes(num) do
    number_to_primes(num, [], 2)
  end

  def number_to_primes(1, acc, _divisor), do: acc

  def number_to_primes(num, acc, divisor) do
    cond do
      rem(num, divisor) == 0 ->
        number_to_primes(trunc(num / divisor), [divisor | acc], divisor)

      true ->
        number_to_primes(num, acc, divisor + 1)
    end
  end

  def remove_first(list, el) do
    remove_first(list, el, [])
  end

  def remove_first([], _el, acc), do: acc

  def remove_first([h | t], el, acc) do
    cond do
      h == el ->
        Enum.concat(acc, t)

      true ->
        remove_first(t, el, [h | acc])
    end
  end

  def first_from_first_list([first | t]) do
    cond do
      first == [] ->
        first_from_first_list(t)

      true ->
        List.first(first)
    end
  end
end
