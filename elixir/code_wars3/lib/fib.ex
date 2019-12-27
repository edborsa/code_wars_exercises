defmodule FibStore do
  use GenServer

  def do_fib(name, number, fib_fun) do
    case get(name, number) do
      nil ->
        result = fib_fun.(number)
        put(name, number, result)
        result

      result ->
        result
    end
  end

  defp get(name, number) do
    GenServer.call(name, {:get, number})
  end

  defp put(name, number, value) do
    GenServer.call(name, {:put, number, value})
  end

  def maybe_start(name) do
    case GenServer.start_link(__MODULE__, [], name: name) do
      {:ok, _pid} ->
        :ok

      {:error, {:already_started, _pid}} ->
        :ok
    end
  end

  # GenServer callbacks
  def init(_) do
    {:ok, %{}}
  end

  def handle_call({:get, number}, _from, state) do
    {:reply, Map.get(state, number), state}
  end

  def handle_call({:put, number, value}, _from, state) do
    {:reply, :ok, Map.put(state, number, value)}
  end
end

defmodule Fib do
  def fibonacci(number) do
    FibStore.maybe_start(__MODULE__)
    Enum.map(0..number, fn n -> fib2(n, &fibonna/1) end)
  end

  def fibonna(0), do: 0
  def fibonna(1), do: 1
  def fibonna(n), do: fib2(n - 1, &fibonna/1) + fib2(n - 2, &fibonna/1)

  def fib(number) do
    FibStore.maybe_start(__MODULE__)
    fib2(number, &Fib.fibonna/1)
  end

  def fib2(number, fun) do
    FibStore.do_fib(__MODULE__, number, fun)
  end
end
