defmodule ReturnNegative do
  def make_negative(num) do
    num
    |> Kernel.abs()
    |> Kernel.*(-1)
  end
end
