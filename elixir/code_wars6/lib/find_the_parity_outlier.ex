defmodule FindTheParityOutlier do
  require Integer

  def find_outlier([h1, h2, h3 | resto] = integers) do
    cond do
      (rem(h1, 2) == 0 && rem(h2, 2) == 0) ||
        (rem(h1, 2) == 0 && rem(h3, 2) == 0) ||
          (rem(h2, 2) == 0 && rem(h3, 2) == 0) ->
        integers
        |> Enum.reject(&Integer.is_even(&1))
        |> List.first()

      true ->
        integers
        |> Enum.reject(&Integer.is_odd(&1))
        |> List.first()
    end
  end
end

# def find_outlier(integers) do
#     {e, o} = Enum.split_with(integers, &(rem(&1, 2) == 0))

#     if length(e) > length(o), do: hd(o), else: hd(e)
# end
