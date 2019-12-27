defmodule SumOfDigits do
  def digital_root(n) do
    n_iteratarion =
      n
      |> Integer.digits()
      |> Enum.sum()

    case n_iteratarion |> Integer.digits() |> length() > 1 do
      true ->
        digital_root(n_iteratarion)

      false ->
        n_iteratarion
    end
  end
end

# defmodule Kata do
#     def digital_root(n) when n < 10, do: n
#     def digital_root(n), do: Integer.digits(n) |> Enum.sum |> digital_root
# end
