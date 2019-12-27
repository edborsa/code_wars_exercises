defmodule StringyStrings do
  def stringy(size) do
    stringy(size, "", :one)
  end

  defp stringy(0, acc, _), do: acc

  defp stringy(size, acc, :one) do
    stringy(size - 1, acc <> "1", :zero)
  end

  defp stringy(size, acc, :zero) do
    stringy(size - 1, acc <> "0", :one)
  end
end
