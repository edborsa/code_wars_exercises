defmodule HighestScoringWord do
  def high(str) do
    str
    |> String.split(" ")
    |> word_to_value()
    |> Enum.sort(&(&1.value > &2.value))
    |> List.first()
    |> Map.fetch!(:word)
  end

  def letter_to_value(letter) do
    letter_to_value(letter, 97)
  end

  def letter_to_value(letter, value) do
    case letter == value do
      true ->
        value - 96

      false ->
        letter_to_value(letter, value + 1)
    end
  end

  def word_to_value(word_list) do
    word_list
    |> Enum.map(fn x ->
      %{
        value:
          String.to_charlist(x)
          |> Enum.reduce(0, &(HighestScoringWord.letter_to_value(&1) + &2)),
        word: x
      }
    end)
  end
end

"""
def high(str) do
    String.split(str, " ")
    |> Enum.max_by(&_score(&1))
  end

defp _score(word) do
  String.to_charlist(word)
  |> Enum.reduce(0, &(&1+&2-96))
end
"""
