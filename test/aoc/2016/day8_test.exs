defmodule Aoc2016.Day8Test do
  use ExUnit.Case
  doctest Aoc2016.Day8
  @moduletag [day8: true, year2016: true]

  test "sample data" do
    m = Aoc.Matrix.new_matrix(7, 3)
    expected = [
      [1, 1, 1, 0, 0, 0, 0],
      [1, 1, 1, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0]
    ]

    assert expected == Aoc2016.Day8.rect(m, 3, 2)
    assert expected == Aoc2016.Day8.command(m, "rect 3x2")
  end

  test "rotate column" do
    m = [
      [1, 1, 1, 0, 0, 0, 0],
      [1, 1, 1, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0]
    ]
    expected = [
      [1, 0, 1, 0, 0, 0, 0],
      [1, 1, 1, 0, 0, 0, 0],
      [0, 1, 0, 0, 0, 0, 0]
    ]

    assert expected == Aoc2016.Day8.rotate_column(m, 1, 1)
    assert expected == Aoc2016.Day8.command(m, "rotate column x=1 by 1")
  end

  test "rotate row" do
    m = [
      [1, 0, 1, 0, 0, 0, 0],
      [1, 1, 1, 0, 0, 0, 0],
      [0, 1, 0, 0, 0, 0, 0]
    ]
    expected = [
      [0, 0, 0, 0, 1, 0, 1],
      [1, 1, 1, 0, 0, 0, 0],
      [0, 1, 0, 0, 0, 0, 0]
    ]

    assert expected == Aoc2016.Day8.rotate_row(m, 0, 4)
    assert expected == Aoc2016.Day8.command(m, "rotate row y=0 by 4")
  end

  test "rotate with overflow" do
    m = [
      [0, 0, 0, 0, 1, 0, 1],
      [1, 1, 1, 0, 0, 0, 0],
      [0, 1, 0, 0, 0, 0, 0]
    ]
    expected = [
      [0, 1, 0, 0, 1, 0, 1],
      [1, 0, 1, 0, 0, 0, 0],
      [0, 1, 0, 0, 0, 0, 0]
    ]
    assert expected == Aoc2016.Day8.rotate_column(m, 1, 1)
    assert expected == Aoc2016.Day8.command(m, "rotate column x=1 by 1")
  end

  test "num lit pixels" do
    m = [
      [0, 0, 0, 0, 1, 0, 1],
      [1, 1, 1, 0, 0, 0, 0],
      [0, 1, 0, 0, 0, 0, 0]
    ]
    assert 6 == Aoc2016.Day8.total_lit_pixels(m)
  end

  test "multiple commands" do
    m = Aoc.Matrix.new_matrix(7, 3)
    expected = [
      [0, 1, 0, 0, 1, 0, 1],
      [1, 0, 1, 0, 0, 0, 0],
      [0, 1, 0, 0, 0, 0, 0]
    ]
    commands =[
      "rect 3x2",
      "rotate column x=1 by 1",
      "rotate row y=0 by 4",
      "rotate column x=1 by 1"
    ]
    assert expected == Aoc2016.Day8.commands(m, commands)
  end

end
