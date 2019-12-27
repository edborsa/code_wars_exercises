defmodule PersistentBugger do
  def persistence(n, x \\ 0)
  def persistence(n, _x) when n < 10, do: 0

  def persistence(n, x) do
    n
    |> Integer.digits()
    |> persistence(x + 1)
  end
end

# defmodule PersistentBugger do
#   def persistence(n, i \\ 0) do
#     case Integer.digits(n) do
#       [_] -> i
#       res -> persistence(Enum.reduce(res, &(&1*&2)), i + 1)
#     end
#   end
# end
