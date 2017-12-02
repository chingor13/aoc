defmodule Aoc2016.Day10Test do
  use ExUnit.Case
  doctest Aoc2016.Day10
  @moduletag [day10: true, year2016: true]

  test "sample input" do
    instructions = [
      "value 5 goes to bot 2",
      "bot 2 gives low to bot 1 and high to bot 0",
      "value 3 goes to bot 1",
      "bot 1 gives low to output 1 and high to bot 0",
      "bot 0 gives low to output 2 and high to output 0",
      "value 2 goes to bot 2"
    ]
    Aoc2016.Day10.instruct(%{}, instructions)
    |> IO.inspect
  end

end
