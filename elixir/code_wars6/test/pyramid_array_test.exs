defmodule PyramidArrayTest do
  use ExUnit.Case

  defp tester(n, exp) do
    act = PyramidArray.pyramid(n)

    assert act == exp,
           "Testing number #{n}, expected #{inspect(exp, charlists: :as_lists)}, got #{
             inspect(act, charlists: :as_lists)
           }"
  end

  test "basic tests" do
    tester(0, [])
    tester(1, [[1]])
    tester(2, [[1], [1, 1]])
    tester(3, [[1], [1, 1], [1, 1, 1]])
  end
end
