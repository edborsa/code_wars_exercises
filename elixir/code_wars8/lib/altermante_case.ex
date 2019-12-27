defmodule AltermanteCase do
  @difference ?a - ?A
  def alter_case(str) do
    str
    |> String.to_charlist()
    |> Enum.map(&alter_case_char(&1))
    |> Kernel.to_string()
  end

  def alter_case_char(h) when h in ?A..?Z, do: h + @difference
  def alter_case_char(h) when h in ?a..?z, do: h - @difference
  def alter_case_char(h), do: h
end
