defmodule Aoc2016.Day2Test do
  use ExUnit.Case
  doctest Aoc2016.Day2
  @moduletag [day2: true, year2016: true]

  test "example1" do
    instructions = [
      "ULL",
      "RRDDD",
      "LURDL",
      "UUUUD"
    ]
    codepad = %Aoc2016.Day2{}
    assert Aoc2016.Day2.code(codepad, instructions) == "1985"
  end

  test "single command" do
    codepad = %Aoc2016.Day2{}
    assert Aoc2016.Day2.code(codepad, "ULL") == "1"
  end

  test "single command 2" do
    codepad = %Aoc2016.Day2{}
    assert Aoc2016.Day2.code(codepad, "ULL") == "1"
  end

  test "no command" do
    codepad = %Aoc2016.Day2{}
    assert Aoc2016.Day2.code(codepad, "") == "5"
  end
end
