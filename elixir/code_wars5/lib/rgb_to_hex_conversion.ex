defmodule RgbToHexConversion do
  def rgb(r, g, b) do
    hex(r) <> hex(g) <> hex(b)
  end

  defp hex(n) do
    n
    |> max(0)
    |> min(255)
    |> Integer.to_string(16)
    |> String.pad_leading(2, "0")
  end
end
