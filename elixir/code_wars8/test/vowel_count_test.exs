defmodule TestVowelCount do
  use ExUnit.Case
  import VowelCount, only: [get_count: 1]

  test "get_count" do
    assert get_count("abracadabra") == 5
  end
end
