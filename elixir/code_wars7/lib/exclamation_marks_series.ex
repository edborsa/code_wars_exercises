defmodule ExclamationMarksSeries do
  def remove(s) do
    String.replace(s, ~r/\!(?!\!*$)/, "")
  end
end
