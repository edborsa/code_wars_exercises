defmodule Spin do
  def spin_words(message) do
    message
    |> String.split(" ")
    |> _spin_words([])
  end

  def _spin_words([] = str_list, acc) do
    {_, answer} =
      Enum.reverse(acc)
      |> Enum.map_reduce("", fn x, acc -> {x, acc <> " " <> x} end)

    String.trim(answer)
  end

  def _spin_words([h | t] = str_list, acc) do
    cond do
      String.length(h) < 5 ->
        _spin_words(t, [h | acc])

      true ->
        reversed_h =
          h
          |> String.graphemes()
          |> Enum.reverse()
          |> Enum.into("")

        _spin_words(t, [reversed_h | acc])
    end
  end
end

"""
defmodule Spin do
  def spin_words(message) do
    message
    |> String.split(" ")
    |> Enum.map_join(" ", &(String.length(&1) >= 5 && String.reverse(&1) || &1))
  end
end

defmodule Spin do
  def spin_words(message) do
    Regex.replace(~r/\w{5,}/, message, &String.reverse/1)
  end
end
"""
