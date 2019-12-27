defmodule BallancedParenteses do
  def balanced_parens(n) do
    Enum.concat(
      String.duplicate("(", n) |> String.graphemes(),
      String.duplicate(")", n) |> String.graphemes()
    )
    |> permutations()
    |> MapSet.new()
    |> Enum.filter(fn x ->
      case x
           |> List.to_string()
           |> Regex.compile() do
        {:ok, _} ->
          true

        {:error, _} ->
          false
      end
    end)
    |> Enum.map(fn x -> List.to_string(x) end)
  end

  def permutations([]), do: [[]]

  def permutations(list) do
    for elem <- list, rest <- permutations(list -- [elem]) do
      [elem | rest]
    end
  end
end
