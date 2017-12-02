defmodule Aoc2016.Day3Test do
  use ExUnit.Case
  doctest Aoc2016.Day3
  @moduletag [day3: true, year2016: true]

  test "basic triangle test" do
    assert false == Aoc2016.Day3.valid_triangle?(5, 10, 25)
    assert false == Aoc2016.Day3.valid_triangle?(5, 6, 23)
    assert false == Aoc2016.Day3.valid_triangle?(3, 3, 6)
    assert true == Aoc2016.Day3.valid_triangle?(5, 6, 7)
  end

  test "basic triangle test array" do
    assert false == Aoc2016.Day3.valid_triangle?([3, 3, 6])
    assert true == Aoc2016.Day3.valid_triangle?([5, 6, 7])
  end

  test "basic triangle test tuple" do
    assert false == Aoc2016.Day3.valid_triangle?({3, 3, 6})
    assert true == Aoc2016.Day3.valid_triangle?({5, 6, 7})
  end

  test "can count valid triagles" do
    assert 1 == Aoc2016.Day3.num_valid_triangles([
      {5, 10, 25},
      {5, 6, 7},
      {5, 6, 12},
      {3, 3, 6}
    ])
  end

end
