defmodule SplitStrings do
  def solution(str) do
    if rem(String.length(str), 2) == 0 do
      _solution(str)
    else
      _solution(str <> "_")
    end
  end

  defp _solution(str) do
    str
    |> String.graphemes()
    |> Enum.chunk_every(2)
    |> Enum.map(&Enum.into(&1, ""))
  end
end
