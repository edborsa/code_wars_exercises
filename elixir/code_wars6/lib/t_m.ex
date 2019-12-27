defmodule TM do
  def thue(n) do
    thue_n(n)
    |> String.slice(0, n)
  end

  def thue_n(1), do: "0"

  def thue_n(n) do
    thue_n(n, "")
    |> String.slice(0, n)
  end

  def thue_n(n, acc) do
    current = thue_n(n - 1)

    current <> invert(current)
  end

  def invert(string) do
    string
    |> String.graphemes()
    |> Enum.map(fn x ->
      cond do
        x == "0" ->
          "1"

        x == "1" ->
          "0"
      end
    end)
    |> Enum.into("")
  end
end
