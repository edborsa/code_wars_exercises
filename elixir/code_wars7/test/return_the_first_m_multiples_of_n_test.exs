defmodule ReturnTheFirstMMultiplesOfNTest do
  use ExUnit.Case

  describe "- Should properly implement multiples/2:" do
    test "multiples(3, 5)" do
      assert ReturnTheFirstMMultiplesOfN.multiples(3, 5) === [5, 10, 15]
    end

    test "multiples(1, 3.14)" do
      assert ReturnTheFirstMMultiplesOfN.multiples(1, 3.14) === [3.14]
    end

    test "multiples(5, -1)" do
      assert ReturnTheFirstMMultiplesOfN.multiples(5, -1) === [-1, -2, -3, -4, -5]
    end
  end
end
