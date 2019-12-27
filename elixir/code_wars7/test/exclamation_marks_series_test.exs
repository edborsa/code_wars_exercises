defmodule ExclamationMarksSeriesTest do
  use ExUnit.Case

  test "Basic tests" do
    assert ExclamationMarksSeries.remove("Hi!") == "Hi!"
    assert ExclamationMarksSeries.remove("Hi!!!") == "Hi!!!"
    assert ExclamationMarksSeries.remove("!Hi") == "Hi"
    assert ExclamationMarksSeries.remove("!Hi!") == "Hi!"
    assert ExclamationMarksSeries.remove("Hi! Hi!") == "Hi Hi!"
    assert ExclamationMarksSeries.remove("Hi") == "Hi"
  end
end
