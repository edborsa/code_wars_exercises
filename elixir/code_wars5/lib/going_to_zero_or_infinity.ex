defmodule GoingToZeroOrInfinity do
  def going(1), do: 1
  def going(n), do: going(n - 1) / n + 1
end
