defmodule ComputeAConvexHull do
  defp cross({ax, ay}, {bx, by}, {ox, oy}), do: (ax - ox) * (by - oy) - (bx - ox) * (ay - oy)

  defp pop(p, [b, a | q]), do: if(cross(a, b, p) > 0, do: [p, b, a | q], else: pop(p, [a | q]))
  defp pop(p, q), do: [p | q]

  def hull_method(points) do
    points = Enum.sort(points)

    [points, Enum.reverse(points)]
    |> Enum.flat_map(fn pts -> pts |> Enum.reduce([], &pop/2) |> tl end)
  end
end
