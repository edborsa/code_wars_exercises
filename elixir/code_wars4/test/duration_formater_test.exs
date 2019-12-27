defmodule DurationFormaterTest do
  use ExUnit.Case
  import DurationFormater, only: [format_duration: 1]

  test "format_duration" do
    assert format_duration(0) == "now"
    assert format_duration(1) == "1 second"
    assert format_duration(62) == "1 minute and 2 seconds"
    assert format_duration(120) == "2 minutes"
    assert format_duration(3600) == "1 hour"
    assert format_duration(3662) == "1 hour, 1 minute and 2 seconds"
    assert format_duration(90_280) == "1 day, 1 hour, 4 minutes and 40 seconds"
    assert format_duration(100_982) == "1 day, 4 hours, 3 minutes and 2 seconds"
    assert format_duration(5_191_123) == "60 days, 1 hour, 58 minutes and 43 seconds"
    assert format_duration(5_878_976) == "68 days, 1 hour, 2 minutes and 56 seconds"
    assert format_duration(6_086_701) == "70 days, 10 hours, 45 minutes and 1 second"
    assert format_duration(6_366_603) == "73 days, 16 hours, 30 minutes and 3 seconds"
    assert format_duration(132_030_240) == "4 years, 68 days, 3 hours and 4 minutes"
  end
end
