defmodule JohnAndAnnSignupForCodewars do
  def john(n), do: Map.values(elem(johnann(n), 1))
  def ann(n), do: Map.values(elem(johnann(n), 2))

  def sum_john(n), do: Enum.sum(john(n))
  def sum_ann(n), do: Enum.sum(ann(n))

  defp johnann(0), do: {0, %{0 => 0}, %{0 => 1}}

  defp johnann(n) do
    Stream.iterate(
      {
        1,
        %{0 => 0, 1 => 0},
        %{0 => 1, 1 => 1}
      },
      fn {i, j, a} ->
        {
          i + 1,
          Map.put(j, i, i - a[j[i - 1]]),
          Map.put(a, i, i - j[a[i - 1]])
        }
      end
    )
    |> Enum.at(n - 1)
  end
end
