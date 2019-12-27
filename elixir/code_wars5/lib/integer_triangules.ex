defmodule IntegerTriangules do
  def give_triang(per), do: give_triang(per, 1, 1, 0)

  def give_triang(per, a, b, count) do
    c = :math.sqrt(a * a + b * b + a * b) |> trunc

    cond do
      a + b >= per ->
        count

      a + b + c > per ->
        give_triang(per, a + 1, a + 1, count)

      is_integer(c) and c * c == a * a + b * b + a * b ->
        give_triang(per, a, b + 1, count + 1)

      true ->
        give_triang(per, a, b + 1, count)
    end
  end
end
