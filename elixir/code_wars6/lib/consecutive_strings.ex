defmodule ConsecutiveStrings do
  def longest_consec(strarr, k) when k > 0 and k <= length(strarr) do
    strarr
    |> Enum.chunk_every(k, 1, :discard)
    |> Enum.map(fn x -> Enum.into(x, "") end)
    |> Enum.max_by(&String.length/1)
  end

  def longest_consec(_, _), do: ""
end
