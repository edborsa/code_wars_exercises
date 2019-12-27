defmodule Denom2 do
  def convert_fracts(ls) do
  end

  def dumb(ls) do
    multi1 = Enum.reduce(ls, 1, fn [_, x], acc -> acc * x end)
    Enum.map(ls, fn [n, d] -> [multi1 / d * n, multi1] end)
  end

  def list_conjunction(listas_de_listas) do
    list_conjunction(listas_de_listas, [])
  end

  def list_conjunction(listas_de_listas, gcd) do
    cond do
      Enum.filter(listas_de_listas, &(&1 != [])) == [] ->
        Enum.reduce(gcd, 1, fn x, acc -> acc * x end)

      true ->
        valor = get_first_vlaue_from_list_conjunctions(listas_de_listas)

        listas_de_listas =
          Enum.map(listas_de_listas, fn x ->
            remove_first(x, valor)
          end)

        list_conjunction(listas_de_listas, [valor | gcd])
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

  def get_first_vlaue_from_list_conjunctions([first | t]) do
    cond do
      first == [] ->
        get_first_vlaue_from_list_conjunctions(t)

      true ->
        List.first(first)
    end
  end
end
