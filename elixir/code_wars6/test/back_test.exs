defmodule BackTest do
  use ExUnit.Case

  def testing(start, stop, exp) do
    IO.puts("Testing : #{start} #{stop}")
    act = Back.backwards_prime(start, stop)
    IO.puts("actual #{inspect(act)}")
    IO.puts("expect #{inspect(exp)}")
    assert act == exp
    IO.puts("#")
  end

  test "backwards_prime" do
    a = [13, 17, 31, 37, 71, 73, 79, 97]
    testing(1, 100, a)
    a = [13, 17, 31]
    testing(1, 31, a)
    a = []
    testing(501, 599, a)
  end
end
