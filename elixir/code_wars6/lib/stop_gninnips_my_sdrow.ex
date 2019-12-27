defmodule StopGninnipsMySdrow do
  def spin_words(message) do
    message
    |> String.split(" ")
    |> Enum.map(fn x ->
      case String.length(x) >= 5 do
        true ->
          String.reverse(x)

        false ->
          x
      end
    end)
    |> Enum.join(" ")
  end
end

# def spin_words(message) do
#   Regex.replace(~r/\w{5,}/, message, &String.reverse/1)
# end
