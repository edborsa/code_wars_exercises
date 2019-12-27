defmodule CountingDuplicatesTest do
  use ExUnit.Case

  alias CountingDuplicates

  test "Example Tests" do
    assert CountingDuplicates.count("") == 0
    assert CountingDuplicates.count("abcde") == 0
    assert CountingDuplicates.count("aabbcde") == 2
    assert CountingDuplicates.count("aabBcde") == 2
    assert CountingDuplicates.count("Indivisibility") == 1
    assert CountingDuplicates.count("Indivisibilities") == 2
  end
end
