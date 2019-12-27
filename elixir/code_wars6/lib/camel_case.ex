defmodule CamelCase do
  def to_camel_case(word) do
    [h | t] =
      word
      |> String.split(~r/\_|\-/)

    [h | Enum.map(t, fn x -> String.capitalize(x) end)]
    |> Enum.into("")
  end
end
