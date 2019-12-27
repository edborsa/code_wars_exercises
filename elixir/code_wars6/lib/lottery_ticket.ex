defmodule LotteryTicket do
  def bingo(ticket, win) do
    ticket
    |> Enum.map(fn [str, num] ->
      if Enum.member?(
           str
           |> String.graphemes(),
           <<num>>
         ) do
        1
      else
        0
      end
    end)
    |> Enum.sum()
    |> case do
      num when num >= win ->
        "Winner!"

      _ ->
        "Loser!"
    end
  end
end
