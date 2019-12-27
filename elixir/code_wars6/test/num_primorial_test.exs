defmodule NumPrimorialTest do
  use ExUnit.Case

  test "is prime" do
    refute PrimorialOfNumber.is_prime(0)
    refute PrimorialOfNumber.is_prime(-7)
    assert PrimorialOfNumber.is_prime(1)
    assert PrimorialOfNumber.is_prime(2)
    assert PrimorialOfNumber.is_prime(3)
    refute PrimorialOfNumber.is_prime(4)
    assert PrimorialOfNumber.is_prime(5)
    refute PrimorialOfNumber.is_prime(6)
  end

  test "some test description" do
    assert PrimorialOfNumber.numPrimorial(1) == 2
    assert PrimorialOfNumber.numPrimorial(2) == 6
    assert PrimorialOfNumber.numPrimorial(3) == 30
  end
end
