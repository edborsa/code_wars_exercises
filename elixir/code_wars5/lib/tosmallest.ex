defmodule Tosmallest do
  def smallest(num) when is_integer(num) do
    num
    |> Integer.digits()
    |> smallest()

    # num, i, j
  end

  def smallest(num_list) do
    i = Enum.find_index(num_list, fn x -> x == Enum.min(num_list) end)
    {num, list} = List.pop_at(num_list, i)
    list
    {int_list, j} = insert_to_lower(list, num, [], 0)
    sorted_index = Enum.sort([i, j])

    [
      Enum.into(int_list, "", &Integer.to_string(&1)) |> String.to_integer(),
      List.first(sorted_index),
      List.last(sorted_index)
    ]
  end

  def insert_to_lower([h | t] = list, num, acc, position_inserted) do
    cond do
      num < h ->
        cond do
          acc == [] ->
            {[num | list], position_inserted}

          true ->
            {[acc, num | list], position_inserted}
        end

      true ->
        insert_to_lower(t, num, [h | acc], position_inserted + 1)
    end
  end
end
