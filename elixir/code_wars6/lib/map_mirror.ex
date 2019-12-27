defmodule MapMirror do
  def mirror(map) do
    reverse_key_string =
      map
      |> Map.keys()
      |> Enum.map(&(Atom.to_string(&1) |> String.reverse()))

    map_keys = map |> Map.keys()

    create_key_value_list(map_keys, reverse_key_string)
    |> Map.new()
  end

  def create_key_value_list(keys, values) do
    create_key_value_list(keys, values, [])
  end

  def create_key_value_list([], [], acc), do: acc

  def create_key_value_list([h0 | t0], [h1 | t1], acc) do
    create_key_value_list(t0, t1, [{h0, h1} | acc])
  end
end

"""
def mirror(map) do
 Map.keys(map)
 |> Map.new(&({ &1, String.reverse(to_string(&1)) }))
end
"""
