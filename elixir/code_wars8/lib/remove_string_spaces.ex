defmodule RemoveStringSpaces do
  def no_space(x) do
    String.replace(x, " ", "")
  end
end
