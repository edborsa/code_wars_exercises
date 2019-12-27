defmodule EvenOrOdd do
  def even_or_odd(number) do
    if Kernel.rem(number, 2) == 0 do
      "Even"
    else
      "Odd"
    end
  end
end
