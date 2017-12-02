defmodule Aoc2016.Day13Test do
  use ExUnit.Case
  doctest Aoc2016.Day13
  @moduletag [day13: true, year2016: true]

  test "open" do
    assert true == Aoc2016.Day13.open?(0, 0, 10)
    assert false == Aoc2016.Day13.open?(1, 0, 10)
  end

  test "board" do
    expected = [
      [0, 1, 0, 1, 1, 1, 1, 0, 1, 1],
      [0, 0, 1, 0, 0, 1, 0, 0, 0, 1],
      [1, 0, 0, 0, 0, 1, 1, 0, 0, 0],
      [1, 1, 1, 0, 1, 0, 1, 1, 1, 0],
      [0, 1, 1, 0, 0, 1, 0, 0, 1, 0],
      [0, 0, 1, 1, 0, 0, 0, 0, 1, 0],
      [1, 0, 0, 0, 1, 1, 0, 1, 1, 1]
    ]
    assert expected == Aoc2016.Day13.generate_board(10, 7, 10)
  end

  test "shortest route" do
    shortest_route = Aoc2016.Day13.generate_board(10, 7, 10)
    |> Aoc2016.Day13.shortest_route({1,1}, {7, 4})

    assert 11 == shortest_route
  end

end
