defmodule HowMuch do
  def howmuch(m, n) do
    m..n
    |> Stream.filter(fn f ->
      rem(f, 9) == 1 and rem(f, 7) == 2
    end)
    |> Stream.map(fn f -> ["M: #{f}", "B: #{div(f, 7)}", "C: #{div(f, 9)}"] end)
    |> Enum.to_list()
  end

  def howmuch(m, n) when m > n, do: howmuch(n, m)

  def howmuch(m, n) do
    for money <- m..n,
        rem(money - 1, 9) == 0,
        rem(money - 2, 7) == 0,
        do: ["M: #{money}", "B: #{div(money - 2, 7)}", "C: #{div(money - 1, 9)}"]
  end
end
