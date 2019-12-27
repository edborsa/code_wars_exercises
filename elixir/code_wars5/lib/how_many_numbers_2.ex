defmodule HowManyNumbers2 do
  def max_sum_dig(nmax, maxsm) do
    n_list = Enum.filter(1000..nmax, &filter(&1, maxsm))

    num =
      n_list
      |> Enum.count()

    sum =
      n_list
      |> Enum.sum()

    average = sum / num
    [num, Enum.min_by(n_list, &abs(&1 - average)), sum]
  end

  defp filter(n, maxsm),
    do: Integer.digits(n) |> Enum.chunk_every(4, 1, []) |> Enum.all?(&(Enum.sum(&1) <= maxsm))
end
