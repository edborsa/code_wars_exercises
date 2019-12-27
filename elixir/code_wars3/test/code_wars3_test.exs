defmodule CodeWars3Test do
  use ExUnit.Case
  doctest CodeWars3

  test "greets the world" do
    assert CodeWars3.hello() == :world
  end
end
