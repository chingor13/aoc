defmodule Aoc2017Test.Day2 do
  use ExUnit.Case
  doctest Aoc2017.Day2
  alias Aoc2017.Day2
  alias Aoc.Input
  @moduletag [day2: true, year2017: true]

  test "checksum" do
    assert 8 == Day2.checksum([5, 1, 9, 5])
  end

  test "example 1" do
    assert 18 == Day2.part1([
      [5, 1, 9, 5],
      [7, 5, 3],
      [2, 4, 8, 8]
    ])
  end

  test "part1" do
    res = "data/2017/day2.txt"
    |> Input.read_number_matrix()
    |> Day2.part1

    IO.puts "Day 2 part 1: #{res}"
  end

  test "divisor" do
    assert 4 == Day2.divisor([5, 9, 2, 8])
  end

  test "divisor 2" do
    assert 3 == Day2.divisor([9, 4, 7, 3])
  end

  test "divisor 3" do
    assert 2 == Day2.divisor([3, 8, 6, 5])
  end

  test "part 2 example 1" do
    assert 9 == Day2.part2([
      [5, 9, 2, 8],
      [9, 4, 7, 3],
      [3, 8, 6, 5]
    ])
  end

  test "part2" do
    res = "data/2017/day2.txt"
    |> Input.read_number_matrix()
    |> Day2.part2

    IO.puts "Day 2 part 2: #{res}"
  end
end
