defmodule TestSplitStrings do
  use ExUnit.Case
  import SplitStrings, only: [solution: 1]

  test "solution" do
    assert solution("abc") == ["ab", "c_"]
    assert solution("abcdef") == ["ab", "cd", "ef"]
  end
end
