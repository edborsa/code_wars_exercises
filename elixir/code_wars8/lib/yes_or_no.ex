defmodule YesOrNo do
  def boolToWord(b) do
    case b do
      true ->
        "Yes"

      false ->
        "No"
    end
  end
end
