defmodule GenecticAlgoSeriesTest do
  use ExUnit.Case

  test "It should respect the given length" do
    assert String.length(GenecticAlgoSeries.generate(16)) == 16
    assert String.length(GenecticAlgoSeries.generate(32)) == 32
    assert String.length(GenecticAlgoSeries.generate(64)) == 64
  end
end
