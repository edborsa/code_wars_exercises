defmodule TestSolution do
  use ExUnit.Case
  import SumMix

  test "sums a list of all binaries" do
    assert sumMin(["1", "2", "3"]) == 6
  end

  test "sums a list of all intergers" do
    assert sumMin([1, 2, 3, 4]) == 10
  end

  test "sums a list of binaries and integers" do
    assert sumMin([0, "1", "2", 3]) == 6
  end

  test "sums a list over randomly generated numbers and binaries" do
    [list, total] = generate_random_numbers([], 0, 100)
    assert sumMin(list) == total
  end

  defp generate_random_numbers(list, total, 0), do: [list, total]

  defp generate_random_numbers(list, total, n) do
    num = :rand.uniform(100)
    new_total = num + total

    if rem(n, 2) == 0 do
      num = Integer.to_string(num)
    end

    new_list = list ++ [num]
    generate_random_numbers(new_list, new_total, n - 1)
  end
end
