defmodule HowManyNines do
  def nines(n) do
    1..n
    |> Stream.filter(fn x ->
      Integer.digits(x)
      |> Enum.member?(9)
    end)
    |> Enum.to_list()

    # |> Enum.count()
  end
end
