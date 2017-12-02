defmodule Aoc2016.Day11Test do
  use ExUnit.Case
  doctest Aoc2016.Day11
  @moduletag [day12: true, year2016: true]

  test "sample input" do
    items = [
      ["HM", "LM"],
      ["HG"],
      ["LG"]
    ]
    assert 11 == Aoc2016.Day11.num_steps(items)
  end

end
