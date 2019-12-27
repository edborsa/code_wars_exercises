defmodule ScreenLockingPatterns do
end

defmodule Kata do
  import Enum
  import MapSet

  @graph %{
    A: {new([:B, :D, :E, :F, :H]), %{B: :C, D: :G, E: :I}},
    B: {new([:A, :C, :D, :E, :F, :G, :I]), %{E: :H}},
    C: {new([:B, :D, :E, :F, :H]), %{B: :A, E: :G, F: :I}},
    D: {new([:A, :B, :C, :E, :G, :H, :I]), %{E: :F}},
    E: {new([:A, :B, :C, :D, :F, :G, :H, :I]), %{}},
    F: {new([:A, :B, :C, :E, :G, :H, :I]), %{E: :D}},
    G: {new([:B, :D, :E, :F, :H]), %{D: :A, E: :C, H: :I}},
    H: {new([:A, :C, :D, :E, :F, :G, :I]), %{E: :B}},
    I: {new([:B, :D, :E, :F, :H]), %{E: :A, F: :C, H: :G}}
  }

  defp count(_node, len, _visited) when len < 2, do: len

  defp count(node, len, visited) do
    {to, from} = @graph[node]

    pass =
      Map.keys(from)
      |> new
      |> intersection(visited)
      |> map(&Map.get(from, &1))
      |> new

    to
    |> union(pass)
    |> difference(visited)
    |> map(&count(&1, len - 1, put(visited, &1)))
    |> sum
  end

  def count_patterns_from(_str, len) when len > 9, do: 0

  def count_patterns_from(str, len) do
    node = str |> String.to_atom()
    count(node, len, new([node]))
  end
end

defmodule Kata do
  def count_patterns_from(first, len) do
    {res, path} = count(first, len - 1, [first], 0)
    res
  end

  defp count(_, rest, path, res) when rest == 0, do: {res + 1, path}

  defp restricted_path(from, path) do
    all = ["A", "B", "C", "D", "E", "F", "G", "H", "I"]

    map = %{
      "A" => ["C", "G", "I"],
      "B" => ["H"],
      "C" => ["A", "G", "I"],
      "D" => ["F"],
      "E" => [],
      "F" => ["D"],
      "G" => ["A", "C", "I"],
      "H" => ["B"],
      "I" => ["G", "A", "C"]
    }

    map_allow = %{
      ["A", "B"] => "C",
      ["A", "E"] => "I",
      ["A", "D"] => "G",
      ["B", "E"] => "H",
      ["C", "B"] => "A",
      ["C", "E"] => "G",
      ["C", "F"] => "I",
      ["D", "E"] => "F",
      ["F", "E"] => "D",
      ["G", "D"] => "A",
      ["G", "E"] => "C",
      ["G", "H"] => "I",
      ["H", "E"] => "B",
      ["I", "H"] => "G",
      ["I", "E"] => "A",
      ["I", "F"] => "C"
    }

    allow =
      Enum.reduce(path, [], fn x, res ->
        l = map_allow[[from] ++ [x]]
        if l != nil, do: res ++ [l], else: res
      end)

    m = if map[from] != nil, do: map[from] -- allow, else: []
    ((all -- [from]) -- m) -- path
  end

  defp count(from, rest, path, res) do
    r =
      restricted_path(from, path)
      |> Enum.reduce(0, fn a, sum ->
        {r1, _} = count(a, rest - 1, path ++ [a], sum)
        r1
      end)

    {res + r, path}
  end
end
