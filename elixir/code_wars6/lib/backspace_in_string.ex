defmodule BackspaceInString do
  def clean_string(string) do
    string
    |> String.graphemes()
    |> clean_string([])
  end

  def clean_string([], answer), do: answer |> Enum.reverse() |> Enum.join()

  def clean_string(["#" | tail] = string, answer) do
    case length(answer) do
      0 ->
        clean_string(tail, [])

      n ->
        [first | rest] = answer
        clean_string(tail, rest)
    end
  end

  def clean_string([h | t], answer) do
    clean_string(t, [h | answer])
  end
end
