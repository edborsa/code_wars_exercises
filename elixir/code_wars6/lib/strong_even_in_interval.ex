defmodule StrongEvenInInterval do
  def strongest_even(n, m) do
    n..m
    |> Enum.filter(&(rem(&1, 2) != 1))
    |> strongest()

    # |> Enum.group_by(&strength/1)
    # |> Map.to_list()
    # |> List.last()
    # |> elem(1)
    # |> List.last()
  end

  defp strongest([h | t]) do
    strongest(t, {h, strength(h)})
  end

  defp strongest([], {num, _}), do: num

  defp strongest([h | t], {num, str}) do
    str_h = strength(h)

    case str_h > str do
      true ->
        strongest(t, {h, str_h})

      false ->
        strongest(t, {num, str})
    end
  end

  defp strength(num) do
    strength(num, 0)
  end

  defp strength(num, str) do
    case rem(num, 2) do
      1 ->
        str

      _ ->
        strength(div(num, 2), str + 1)
    end
  end

  def strongest_even(n, m, q \\ 1) do
    cond do
      m == n -> n * q
      rem(n, 2) == 1 -> strongest_even(n + 1, m, q)
      true -> strongest_even(div(n, 2), div(m, 2), q * 2)
    end
  end
end
