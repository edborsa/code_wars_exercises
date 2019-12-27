defmodule AlphabeticAnagram do
end

defmodule Kata do
  def list_position(""), do: 1

  def list_position(word = <<c0, cs::binary>>) do
    list_position(cs) +
      div(
        Enum.count(for(<<c <- word>>, do: c), &(&1 < c0)) * factorial(byte_size(word) - 1),
        Enum.reduce(Enum.frequencies(for <<c <- word>>, do: c), 1, fn {_, n}, a ->
          a * factorial(n)
        end)
      )
  end

  defp factorial(0), do: 1
  defp factorial(n), do: n * factorial(n - 1)
end

defmodule Kata do
  def list_position(word), do: list_pos(String.codepoints(word))
  defp list_pos([]), do: 1

  defp list_pos(arr = [first | tail]),
    do: calc(sort_arr(arr), length(tail)) * count_less(first, tail) + list_pos(tail)

  defp calc(sorted_arr, m),
    do: Enum.reduce(sorted_arr, f(m), fn {_, num}, mult -> div(mult, f(num)) end)

  defp count_less(letter, tail),
    do: Enum.reduce(tail, 0, fn x, sum -> if x < letter, do: sum + 1, else: sum end)

  defp sort_arr(arr),
    do:
      arr
      |> Enum.sort()
      |> Enum.chunk_by(& &1)
      |> Enum.map(fn x -> {Enum.at(Enum.dedup(x), 0), length(x)} end)

  defp f(0), do: 1
  defp f(n) when n > 0, do: n * f(n - 1)
end

defmodule Kata do
  def list_position(word) do
    letters = String.graphemes(word)
    do_list_position(0, letters)
  end

  def do_list_position(counter, []), do: counter + 1

  def do_list_position(counter, [head | tail] = letters) do
    counter = counter + next_varianty_count(letters, head)
    do_list_position(counter, tail)
  end

  def next_varianty_count(letters, letter) do
    letters = Enum.sort(letters)

    letters
    |> Enum.uniq()
    |> Enum.sort()
    |> Enum.take_while(&(&1 != letter))
    |> Enum.map(fn x -> varianty_count(List.delete(letters, x)) end)
    |> Enum.sum()
  end

  def factorial(n) when n <= 1, do: 1
  def factorial(n) when n > 1, do: n * factorial(n - 1)

  @spec varianty_count(any, any) :: integer
  def varianty_count(n, k) when is_integer(n), do: div(factorial(n), k)

  def varianty_count(letters) do
    letters_quotient =
      letters
      |> Enum.reduce(%{}, fn x, acc -> Map.update(acc, x, 1, &(&1 + 1)) end)
      |> Enum.map(fn {_, x} -> factorial(x) end)
      |> Enum.reduce(fn x, acc -> acc * x end)

    varianty_count(Enum.count(letters), letters_quotient)
  end
end
