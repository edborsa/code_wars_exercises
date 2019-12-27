ExUnit.start()

defmodule DenomTest do
  use ExUnit.Case

  # Versao Burra
  # multiplica , divide multiplica
  # -----------
  # 1) Pega denominadores multiplica eles
  # 1) Decompe em primos p1)
  # 2) Pega Nominadores
  # 2) decompoe em primos p2)
  # 3) faz conjuncao de todos eles cp2)
  # 3) Faz conjuncao p1) com cp2) e multiplica. Esse eh o valor que pode dividir em cima e em baixo

  def testing(ls, exp) do
    IO.puts("Testing #{inspect(ls, charlists: :as_lists)}")
    act = Denom.convert_fracts(ls)
    IO.puts("act #{inspect(act, charlists: :as_lists)}")
    IO.puts("exp #{inspect(exp, charlists: :as_lists)}")
    assert act == exp
    IO.puts("#")
  end

  test "list disjunction" do

  end
  test "convert_fracts" do
    lst = [[69, 130], [87, 1310], [3, 4]]
    testing(lst, [[18078, 34060], [2262, 34060], [25545, 34060]])
    lst = [[690, 1300], [87, 1310], [30, 40]]
    testing(lst, [[18078, 34060], [2262, 34060], [25545, 34060]])
    lst = []
    testing(lst, [])
  end
end
