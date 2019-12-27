defmodule IntegerDepth do
  @all_digits MapSet.new([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
  def compute_depth(n) do
    compute_depth(MapSet.new(), 1, n)
  end

  def compute_depth(current_digits, times, num) do
    cond do
      MapSet.equal?(current_digits, @all_digits) == true ->
        times - 1

      true ->
        (num * times)
        |> Integer.digits()
        |> MapSet.new()
        |> MapSet.union(current_digits)
        |> compute_depth(times + 1, num)
    end
  end
end
