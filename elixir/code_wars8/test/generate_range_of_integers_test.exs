defmodule GenerateRangeOfIntegersTest do
  use ExUnit.Case
  import GenerateRangeOfIntegers, only: [generate_range: 3]

  test "basic cases" do
    assert generate_range(2, 10, 2) == [2, 4, 6, 8, 10]
    assert generate_range(1, 10, 3) == [1, 4, 7, 10]
    assert generate_range(1, 10, 1) == [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    assert generate_range(1, 10, 4) == [1, 5, 9]
    assert generate_range(1, 10, 5) == [1, 6]
  end
end
