defmodule TestNextBigThing do
  use ExUnit.Case
  import NextBigThing, only: [next_item: 2]

  test "work on simple examples" do
    assert next_item(Enum.to_list(1..100), 7) == 8
    assert next_item(["Joe", "Bob", "Sally"], "Bob") == "Sally"
    assert next_item('character list', ?l) == ?i
  end
end
