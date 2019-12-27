defmodule RemoveFirstAndLastCharacter do
  def remove_chars(s) do
    s
    |> String.graphemes()
    |> Enum.slice(1..-2)
    |> Enum.into("")
  end
end
