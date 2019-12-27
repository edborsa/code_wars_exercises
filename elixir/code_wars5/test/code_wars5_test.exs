defmodule CodeWars5Test do
  use ExUnit.Case
  doctest CodeWars5

  test "greets the world" do
    assert CodeWars5.hello() == :world
  end
end
