defmodule MapMirrorTest do
  use ExUnit.Case

  test "some test description" do
    assert MapMirror.mirror(%{dado: 0}) == %{dado: "odad"}
    assert MapMirror.mirror(%{dado: "0", blop: "0"}) == %{dado: "odad", blop: "polb"}
  end
end
