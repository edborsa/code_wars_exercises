defmodule Snail do
  @doc """

  Converts a matrix to a list by walking around its edges from the top-left going clockwise.

  ![snail walk](http://www.haan.lu/files/2513/8347/2456/snail.png)

  iex> Snail.snail( [ [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] ] )
  [ 1, 2, 3, 6, 9, 8, 7, 4, 5 ]

  """

  @spec snail([[term]]) :: [term]

  def snail(matrix) when length(matrix) == 1 do
    snail(List.first(matrix), [], [])
  end

  def snail(matrix) when length(matrix) == 2 do
    snail(List.first(matrix), [], List.last(matrix))
  end

  def snail(matrix) when length(matrix) >= 3 do
    middle = Enum.slice(matrix, 1..(length(matrix) - 2))

    snail(List.first(matrix), middle, List.last(matrix))
  end

  def snail(first, middle, last) do
    snail_last(first |> Enum.reverse(), middle, last)
  end

  def snail_last(first, [], []), do: first |> Enum.reverse()

  def snail_last(first, middle, last) do
    first =
      Enum.reduce(middle, first, fn x, acc ->
        [List.last(x) | acc]
      end)

    first = Enum.concat(Enum.reverse(first), Enum.reverse(last))

    middle =
      Enum.map(middle, fn x ->
        List.pop_at(x, length(x) - 1)
        |> elem(1)
      end)
      |> Enum.filter(fn x -> x != [] end)

    snail_first(first, middle |> Enum.reverse(), [])
  end

  def snail_first(first, [], []), do: first

  def snail_first(first, middle, last) do
    first =
      Enum.reduce(middle, first |> Enum.reverse(), fn x, acc ->
        [List.first(x) | acc]
      end)

    middle =
      Enum.map(middle, fn x ->
        List.pop_at(x, 0)
        |> elem(1)
      end)
      |> Enum.filter(fn x -> x != [] end)

    Enum.concat(first |> Enum.reverse(), snail(middle |> Enum.reverse()))
  end
end

"""
defmodule Matrix do
  def horiz_reflect(m), do: m |> Enum.reverse
  def transpose(m),     do: m |> List.zip |> Enum.map(&Tuple.to_list(&1))
  def rotate(m),        do: m |> Matrix.transpose |> Matrix.horiz_reflect
end

defmodule Snail do
  def snail([]), do: []
  def snail( [h|t] ), do: h ++ (t |> Matrix.rotate |> snail)
  end
"""

"""
def snail(matrix) when matrix == [] or length(length(matrix)) == 1, do: matrix

def snail([first_row | other]) do
  {second_row, other} = Enum.reduce(other, {[], []}, &rev_head_tail(&1, &2))
  Enum.concat([first_row, Enum.reverse(second_row), snail(other)])
end

defp rev_head_tail(line, {heads, tails}) do
  [head | tail] = Enum.reverse(line)
  {[head | heads], [tail | tails]}
end
"""

"""
def snail(matrix), do: do_snail(matrix, [])

defp do_snail([], nums), do: nums
defp do_snail(matrix, nums) do
  new_matrix =
    matrix
    |> List.delete_at(0)
    |> rotate
  do_snail(new_matrix, nums ++ List.first(matrix))
end

defp rotate(matrix) do
  matrix
  |> Enum.map(&Enum.reverse/1)
  |> List.zip
  |> Enum.m
"""
