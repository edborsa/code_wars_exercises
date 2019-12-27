defmodule CheckPassword do
  def check(password, hashed_password), do: hash(password) === hashed_password

  defp hash(password), do: :crypto.hash(:sha256, password) |> Base.encode16()
end
