defmodule CodeWars6Test do
  use ExUnit.Case
  doctest CodeWars6

  test "greets the world" do
    assert CodeWars6.hello() == :world
  end
end
