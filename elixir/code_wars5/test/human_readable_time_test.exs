defmodule HumanReadableTimeTest do
  use ExUnit.Case

  test "basic cases" do
    assert HumanReadableTime.format(0) == "00:00:00"
    assert HumanReadableTime.format(59) == "00:00:59"
    assert HumanReadableTime.format(60) == "00:01:00"
    assert HumanReadableTime.format(90) == "00:01:30"
    assert HumanReadableTime.format(3599) == "00:59:59"
    assert HumanReadableTime.format(3600) == "01:00:00"
    assert HumanReadableTime.format(45296) == "12:34:56"
    assert HumanReadableTime.format(86399) == "23:59:59"
    assert HumanReadableTime.format(86400) == "24:00:00"
    assert HumanReadableTime.format(359_999) == "99:59:59"
  end
end
