defmodule ParenthesesValidator do
  def valid_parentheses(string) do
    Regex.compile(string)
    |> case do
      {:ok, _} ->
        true

      {:error, _} ->
        false
    end
  end
end
