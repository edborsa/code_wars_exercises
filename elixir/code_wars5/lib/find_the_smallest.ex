defmodule FindTheSmallest do
  def smallest(n) do
    all_digits = Integer.digits(n)
    len = length(all_digits)

    for {digit, index} <- Enum.with_index(all_digits) do
      remaining_digits = List.delete_at(all_digits, index)

      for j <- 0..(len - 1) do
        n1 =
          remaining_digits
          |> List.insert_at(j, digit)
          |> Integer.undigits()

        [n1, index, j]
      end
      |> Enum.min()
    end
    |> Enum.min()
  end
end
