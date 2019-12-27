defmodule TheHashtagGeneratorTest do
  use ExUnit.Case

  test "with fixed inputs" do
    assert TheHashtagGenerator.generate("") == false, "Expected an empty string to return false"

    assert " " |> String.duplicate(200) |> TheHashtagGenerator.generate() == false,
           "Still an empty string"

    assert TheHashtagGenerator.generate("Do We have A Hashtag") == "#DoWeHaveAHashtag",
           "Expected a Hashtag (#) at the beginning."

    assert TheHashtagGenerator.generate("Codewars") == "#Codewars", "Should handle a single word."

    assert TheHashtagGenerator.generate("Codewars Is Nice") == "#CodewarsIsNice",
           "Should remove spaces."

    assert TheHashtagGenerator.generate("Codewars is nice") == "#CodewarsIsNice",
           "Should capitalize first letters of words."

    assert TheHashtagGenerator.generate("code" <> String.duplicate(" ", 140) <> "wars") ==
             "#CodeWars",
           "#CodeWars"

    assert TheHashtagGenerator.generate("L" <> String.duplicate("o", 155) <> "ng Cat") == false,
           "Should return false if the final word is longer than 140 chars."

    assert "a" |> String.duplicate(139) |> TheHashtagGenerator.generate() ==
             "#A" <> String.duplicate("a", 138),
           "Should work"

    assert "a" |> String.duplicate(140) |> TheHashtagGenerator.generate() == false, "Too long"
  end
end
