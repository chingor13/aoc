defmodule Aoc2016.Day1Test do
  use ExUnit.Case
  doctest Aoc2016.Day1
  @moduletag [day1: true, year2016: true]

  test "example1" do
    dist = Aoc2016.Day1.new()
    |> Aoc2016.Day1.move(["R2", "L3"])
    |> Aoc2016.Day1.distance

    assert dist == 5
  end

  test "example2" do
    dist = Aoc2016.Day1.new()
    |> Aoc2016.Day1.move(["R2", "R2", "R2"])
    |> Aoc2016.Day1.distance

    assert dist == 2
  end

  test "example3" do
    dist = Aoc2016.Day1.new()
    |> Aoc2016.Day1.move(["R5", "L5", "R5", "R3"])
    |> Aoc2016.Day1.distance

    assert dist == 12
  end
end
