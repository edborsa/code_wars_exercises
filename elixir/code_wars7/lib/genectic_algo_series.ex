defmodule GenecticAlgoSeries do
  def generate(length) do
    String.duplicate(Enum.random(0..1) |> to_string, length)
  end
end
