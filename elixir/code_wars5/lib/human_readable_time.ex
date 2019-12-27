defmodule HumanReadableTime do
  def format(secs) do
    pad2 = fn n ->
      n
      |> Integer.to_string()
      |> String.pad_leading(2, "0")
    end

    [div(secs, 3600), div(rem(secs, 3600), 60), rem(secs, 60)]
    |> Enum.map_join(":", pad2)
  end
end
