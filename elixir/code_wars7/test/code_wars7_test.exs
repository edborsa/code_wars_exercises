defmodule CodeWars7Test do
  use ExUnit.Case
  doctest CodeWars7

  test "greets the world" do
    assert CodeWars7.hello() == :world
  end
end
