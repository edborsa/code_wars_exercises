defmodule CodeWars4Test do
  use ExUnit.Case
  doctest CodeWars4

  test "greets the world" do
    assert CodeWars4.hello() == :world
  end
end
