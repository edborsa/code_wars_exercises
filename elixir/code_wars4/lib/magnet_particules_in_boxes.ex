defmodule MagnetParticulesInBoxes do
  def doubles(maxk, maxn) do
    Enum.sum(
      for k <- 1..maxk, n <- 1..maxn do
        1 / (k * :math.pow(n + 1, 2 * k))
      end
    )
  end
end
