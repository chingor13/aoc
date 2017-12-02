defmodule Aoc2016.Day6Test do
  use ExUnit.Case
  doctest Aoc2016.Day6
  @moduletag [day6: true, year2016: true]

  test "sample data" do
    message = Aoc.Input.read_rows("data/2016/day6_test.txt")
    |> Aoc2016.Day6.message

    assert "easter" == message
  end

  test "most common letter" do
    assert "e" == Aoc2016.Day6.most_common_letter(["e", "d", "e", "r", "a", "t", "s", "r", "n", "n", "s", "t", "v", "v", "d",
  "e"])
  end

  test "sample data least common" do
    message = Aoc.Input.read_rows("data/2016/day6_test.txt")
    |> Aoc2016.Day6.least_common_message

    assert "advent" == message
  end

end
