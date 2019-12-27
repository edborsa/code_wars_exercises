defmodule StopGninnipsMySdrowTest do
  use ExUnit.Case

  alias StopGninnipsMySdrow

  test "Have fun!" do
    assert StopGninnipsMySdrow.spin_words("Have fun!") == "Have fun!"
  end

  test "Welcome is reversed" do
    assert StopGninnipsMySdrow.spin_words("Welcome") == "emocleW"
  end

  test "First word is not reversed" do
    assert StopGninnipsMySdrow.spin_words("Hey fellow warriors") == "Hey wollef sroirraw"
  end
end
