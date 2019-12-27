defmodule CountingDuplicates do
  def count(""), do: 0

  def count(str) do
    str
    |> String.downcase()
    |> String.graphemes()
    |> Enum.group_by(& &1)
    |> Enum.map(fn {_key, value} ->
      {value, length(value)}
    end)
    |> Enum.reject(fn {_, length} -> length < 2 end)
    |> length()
  end
end
