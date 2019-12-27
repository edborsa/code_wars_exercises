defmodule SumOfPairs do
  @doc """

  Finds the first pair of ints as judged by the index of the second value.

  iex> sum_pairs( [ 10, 5, 2, 3, 7, 5 ], 10 )

  { 3, 7 }

  """
  # def sum_pairs([h0, h1 | t], sum) do
  #   sum_pairs(t, [h0, h1], [], sum)
  # end
  #
  # def sum_pairs(_, _), do: []
  #
  # def sum_pairs([h | t], current_list, [], sum) do
  #   sum_pairs(
  #     t,
  #     [h | current_list],
  #     generate_new_pairs(current_list, h, sum),
  #     sum
  #   )
  # end
  #
  # def sum_pairs([], _current_list, [], _sum), do: nil
  # def sum_pairs(list, current_list, new_pairs, sum), do: new_pairs |> List.to_tuple()

  def generate_new_pairs([], _new_el, _sum), do: []

  def generate_new_pairs([h | t] = list, new_el, sum) do
    cond do
      h + new_el == sum ->
        [h, new_el]

      true ->
        generate_new_pairs(t, new_el, sum)
    end
  end

  def test() do
    100_0000..1 |> Enum.to_list() |> sum_pairs(3)
  end

  def sum_pairs(ints, sum), do: get_sum_pairs(ints, sum, MapSet.new())

  defp get_sum_pairs([], _sum, _acc), do: nil

  defp get_sum_pairs([head | tail], sum, acc) do
    case MapSet.member?(acc, sum - head) do
      true -> {sum - head, head}
      false -> get_sum_pairs(tail, sum, MapSet.put(acc, head))
    end
  end

  """
  def sum_pairs( ints, sum ) do
      do_sum_pairs( ints, sum, MapSet.new )
    end


    @spec do_sum_pairs( [ integer ], integer, MapSet.t ) :: { integer, integer } | nil

    defp do_sum_pairs( [], _, _ ), do: nil

    defp do_sum_pairs( [ h | t ], sum, cache ) do

      if MapSet.member?( cache, sum - h ) do
        { sum - h, h }

      else
        do_sum_pairs( t, sum, MapSet.put( cache, h ) )

      end

    end
  """
end
