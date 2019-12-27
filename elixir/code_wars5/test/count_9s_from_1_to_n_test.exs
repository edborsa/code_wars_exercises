defmodule Count9sFrom1ToNTest do
  use ExUnit.Case

  def run_test(n, sol), do: assert(Count9sFrom1ToN.number9(n) == sol, "Nein!")

  describe "Sample tests" do
    test "1", do: run_test(1, 0)
    test "9", do: run_test(9, 1)
    test "100", do: run_test(100, 20)
    test "565754", do: run_test(565_754, 275_645)
    test "10000000000", do: run_test(10_000_000_000, 10_000_000_000)
  end
end
