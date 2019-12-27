defmodule SumOfDigitsTest do
  use ExUnit.Case

  alias SumOfDigits

  test "foo" do
    assert SumOfDigits.digital_root(16) == 7
    assert SumOfDigits.digital_root(942) == 6
  end

  test "16", do: assert(SumOfDigits.digital_root(16) == 7)
  test "456", do: assert(SumOfDigits.digital_root(456) == 6)
end
