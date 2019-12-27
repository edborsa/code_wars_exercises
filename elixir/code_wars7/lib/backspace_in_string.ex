defmodule BackspaceInString do
  def clean_string(s) do
    IO.puts("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
    IO.inspect(s)
    IO.puts("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")

    if String.match?(s, ~r/[^#](?R)*#|\G#/s) do
      s
      |> String.replace(~r/[^#](?R)*#|\G#/s, "")
      |> clean_string()
    else
      s
    end
  end
end
