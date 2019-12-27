defmodule ReturnNegativeTest do
  use ExUnit.Case

  alias ReturnNegative

  import ReturnNegative, only: [make_negative: 1]

  test "simple check" do
    assert make_negative(42) == -42
    assert make_negative(-4) == -4
  end
end
