defmodule EvenOrOddTest do
  use ExUnit.Case

  alias EvenOrOdd

  test "basic" do
    assert EvenOrOdd.even_or_odd(2) == "Even"
    assert EvenOrOdd.even_or_odd(0) == "Even"
    assert EvenOrOdd.even_or_odd(7) == "Odd"
    assert EvenOrOdd.even_or_odd(1) == "Odd"
    assert EvenOrOdd.even_or_odd(-1) == "Odd"
  end
end
