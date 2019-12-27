defmodule StringMix do
  ## IDK how to sort this shit
  def mix(s1, s2) do
    s1 =
      s1
      |> String.replace(~r/(?![a-z]).{1}/, "")
      |> String.to_charlist()
      |> count()

    s2 =
      s2
      |> String.replace(~r/(?![a-z]).{1}/, "")
      |> String.to_charlist()
      |> count()

    Enum.reduce(s1, s2, fn {key, value}, acc ->
      Map.update(acc, key, value, fn _ ->
        if Map.get(s2, key) == nil do
          {1, value}
        else
          case Map.get(s2, key) == value do
            true ->
              {:equal, value}

            false ->
              case Enum.max([s2 |> Map.get(key), value]) == Map.get(s2, key) do
                true -> {2, Map.get(s2, key)}
                false -> {1, value}
              end
          end
        end
      end)
    end)
    |> Map.to_list()
    |> Enum.filter(fn {_letter, times} -> times != 1 && times != {:equal, 1} end)
    |> Enum.map(fn
      {letter, {:equal, times}} ->
        "=:#{String.duplicate(to_string([letter]), times)}"

      {letter, {belongs, times}} ->
        "#{belongs}:#{String.duplicate(to_string([letter]), times)}"
    end)
    |> Enum.sort()
    |> Enum.join("/")
  end

  def count(sentence) when is_list(sentence) do
    Enum.reduce(sentence, %{}, fn el, acc ->
      Map.update(acc, el, 1, &(&1 + 1))
    end)
  end
end
