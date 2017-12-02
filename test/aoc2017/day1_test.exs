defmodule Aoc2017Test.Day1 do
  use ExUnit.Case
  doctest Aoc2017.Day1
  @moduletag :day1

  test "example 1" do
    assert 3 == Aoc2017.Day1.part1(1122)
  end

  test "example 2" do
    assert 4 == Aoc2017.Day1.part1(1111)
  end

  test "example 3" do
    assert 0 == Aoc2017.Day1.part1(1234)
  end

  test "example 4" do
    assert 9 == Aoc2017.Day1.part1(91212129)
  end

  test "part1" do
    res = "data/day1.txt"
    |> Aoc2017.Input.read_digits
    |> Aoc2017.Day1.part1

    IO.puts "Day 1 part 1: #{res}"
  end

  test "part 2 example 1" do
    assert 6 == Aoc2017.Day1.part2(1212)
  end

  test "part 2 example 2" do
    assert 0 == Aoc2017.Day1.part2(1221)
  end

  test "part 2 example 3" do
    assert 4 == Aoc2017.Day1.part2(123425)
  end

  test "part 2 example 4" do
    assert 12 == Aoc2017.Day1.part2(123123)
  end

  test "part 2 example 5" do
    assert 4 == Aoc2017.Day1.part2(12131415)
  end

  test "part2" do
    res = "data/day1.txt"
    |> Aoc2017.Input.read_digits
    |> Aoc2017.Day1.part2

    IO.puts "Day 1 part 2: #{res}"
  end
end
