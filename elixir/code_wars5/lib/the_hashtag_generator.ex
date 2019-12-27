defmodule TheHashtagGenerator do
  def generate(input) do
    hashtaged_input =
      input
      |> String.trim()
      |> String.replace(~r/\s{2,}/, " ")
      |> String.split(" ")
      |> Enum.map(&String.capitalize(&1))
      |> Enum.join()

    case String.length(hashtaged_input) do
      0 ->
        false

      n when n >= 140 ->
        false

      _ ->
        "#" <> hashtaged_input
    end
  end
end
