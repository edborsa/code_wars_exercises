defmodule HowManyNinesTest do
  use ExUnit.Case

  def do_test(n, sol), do: assert(HowManyNines.nines(n) == sol)

  describe "How many nines?" do
    test "Example tests" do
      do_test(1, 0)
      do_test(10, 1)
      do_test(100, 19)
      do_test(1000, 271)
      do_test(3950, 1035)
    end
  end
end
