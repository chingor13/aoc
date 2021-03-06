defmodule Aoc2017Test.Day1 do
  use ExUnit.Case
  doctest Aoc2017.Day1
  alias Aoc2017.Day1
  alias Aoc.Input
  @moduletag [day1: true, year2017: true]

  test "example 1" do
    assert 3 == Day1.part1(1122)
  end

  test "example 2" do
    assert 4 == Day1.part1(1111)
  end

  test "example 3" do
    assert 0 == Day1.part1(1234)
  end

  test "example 4" do
    assert 9 == Day1.part1(91212129)
  end

  test "part1" do
    res = "data/2017/day1.txt"
    |> Input.read_digits
    |> Day1.part1

    IO.puts "Day 1 part 1: #{res}"
  end

  test "part 2 example 1" do
    assert 6 == Day1.part2(1212)
  end

  test "part 2 example 2" do
    assert 0 == Day1.part2(1221)
  end

  test "part 2 example 3" do
    assert 4 == Day1.part2(123425)
  end

  test "part 2 example 4" do
    assert 12 == Day1.part2(123123)
  end

  test "part 2 example 5" do
    assert 4 == Day1.part2(12131415)
  end

  test "part2" do
    res = "data/2017/day1.txt"
    |> Input.read_digits
    |> Day1.part2

    IO.puts "Day 1 part 2: #{res}"
  end
end
