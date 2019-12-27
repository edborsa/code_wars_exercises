defmodule Kata do
  def the_lift(queues, capacity) do
    queues
    |> init_state
    |> Map.put(:capacity, capacity)
    |> run_lift
  end

  def init_state(queues) do
    Enum.reduce(queues, %{todo: 0}, fn x, acc ->
      acc
      |> Map.put(map_size(acc) - 1, x)
      |> Map.update!(:todo, &(&1 + length(x)))
    end)
    |> Map.put(:floor, 0)
    |> Map.put(:history, [0])
    |> Map.put(:riders, [])
    |> Map.put(:direction, "UP")
    |> Map.put(:height, length(queues) - 1)
  end

  def run_lift(%{:todo => 0} = state), do: state.history |> add_history(0) |> Enum.reverse()

  def run_lift(state) do
    state
    |> validate_direction
    |> pick_up
    |> move
    |> drop_off
    |> run_lift
  end

  def validate_direction(%{:floor => a, :height => a} = state),
    do: Map.put(state, :direction, "DN")

  def validate_direction(%{:floor => 0} = state), do: Map.put(state, :direction, "UP")
  def validate_direction(state), do: state

  def pick_up(state) do
    {ready, not_ready} =
      Enum.split_with(state[state.floor], fn x ->
        case state.direction do
          "UP" -> x > state.floor
          "DN" -> x < state.floor
        end
      end)

    {taken, cant_fit} = Enum.split(ready, state.capacity - length(state.riders))

    state
    |> Map.update!(:riders, &(taken ++ &1))
    |> Map.put(state.floor, not_ready ++ cant_fit)
    |> Map.put(
      :history,
      if length(ready) > 0 do
        add_history(state.history, state.floor)
      else
        state.history
      end
    )
  end

  def move(%{:direction => "UP"} = state), do: Map.update!(state, :floor, &(&1 + 1))
  def move(%{:direction => "DN"} = state), do: Map.update!(state, :floor, &(&1 - 1))

  def drop_off(state) do
    {done, waiting} = Enum.split_with(state.riders, &(&1 == state.floor))
    done = length(done)

    state
    |> Map.update!(:todo, &(&1 - done))
    |> Map.put(:riders, waiting)
    |> Map.put(
      :history,
      if done > 0 do
        add_history(state.history, state.floor)
      else
        state.history
      end
    )
  end

  def add_history([h | t], h), do: [h | t]
  def add_history([h | t], a), do: [a | [h | t]]
end

defmodule Kata do
  def the_lift(queues, capacity) do
    lift(
      0,
      [],
      List.duplicate(0, length(queues)),
      split_queues(queues),
      capacity,
      length(queues),
      1
    )
    |> Enum.dedup()
  end

  def lift(floor, stops, insiders, queues, capacity, num_floors, up_down)
      when floor == num_floors - 1 and up_down == 1 do
    lift(floor, stops, insiders, queues, capacity, num_floors, -1)
  end

  def lift(floor, stops, insiders, queues, capacity, num_floors, up_down)
      when floor < 0 and up_down == -1 do
    lift(floor + 1, stops, insiders, queues, capacity, num_floors, 1)
  end

  def lift(floor, stops, insiders, queues, capacity, num_floors, up_down) do
    if queue_size(queues) == 0 && Enum.sum(insiders) == 0 do
      if Enum.at(stops, -1) == 0, do: stops, else: stops ++ [0]
    else
      out = Enum.at(insiders, floor)
      n_insiders = if out > 0, do: List.update_at(insiders, floor, &(&1 - out)), else: insiders

      {passers, n_queues, stop} =
        get_passers(queues, floor, capacity - Enum.sum(n_insiders), up_down)

      n_insiders =
        Enum.reduce(passers, n_insiders, fn el, insiders ->
          List.update_at(insiders, el, &(&1 + 1))
        end)

      n_stops =
        if stop || out > 0 || length(passers) > 0 || length(stops) == 0,
          do: stops ++ [floor],
          else: stops

      lift(floor + up_down, n_stops, n_insiders, n_queues, capacity, num_floors, up_down)
    end
  end

  defp get_passers(queues, floor, max, up_down) when up_down == -1 do
    {up, down} = Enum.at(queues, floor)
    stop = if length(down) > 0, do: true, else: false
    {n_down, down} = Enum.split(down, max)
    {n_down, List.replace_at(queues, floor, {up, down}), stop}
  end

  defp get_passers(queues, floor, max, up_down) when up_down == 1 do
    {up, down} = Enum.at(queues, floor)
    stop = if length(up) > 0, do: true, else: false
    {n_up, up} = Enum.split(up, max)
    {n_up, List.replace_at(queues, floor, {up, down}), stop}
  end

  defp split_queues(queues),
    do:
      for(
        {arr, ind} <- Enum.with_index(queues),
        do: Enum.split_with(arr, fn val -> val > ind end)
      )

  defp queue_size(queue),
    do: Enum.reduce(queue, 0, fn {a1, a2}, acc -> acc + length(a1) + length(a2) end)
end

defmodule Kata do
  import Enum

  defp work(acc, cap) do
    {qs, {lift, hist}} = acc

    if empty?(lift) and all?(qs, fn {_, q} -> empty?(q) end) do
      if(hd(hist) == 0, do: hist, else: [0 | hist]) |> reverse
    else
      [&Kernel.>/2, &Kernel.</2]
      |> reduce(acc, fn cmp, {qs, {lift, hist}} ->
        {qs, st} =
          map_reduce(qs, {lift, hist}, fn {fl, q}, {li, hi} ->
            if any?(li, &(fl == &1)) or any?(q, &cmp.(&1, fl)) do
              li = reject(li, &(fl == &1))

              {q, {li, _}} =
                map_reduce(q, {li, cap - length(li)}, fn p, {li, n} ->
                  if(n > 0 and cmp.(p, fl), do: {nil, {[p | li], n - 1}}, else: {p, {li, n}})
                end)

              hi = if hd(hi) == fl, do: hi, else: [fl | hi]
              {{fl, reject(q, &Kernel.is_nil/1)}, {li, hi}}
            else
              {{fl, q}, {li, hi}}
            end
          end)

        {reverse(qs), st}
      end)
      |> work(cap)
    end
  end

  def the_lift(queues, capacity),
    do: work({zip(0..(length(queues) - 1), queues), {[], [0]}}, capacity)
end
