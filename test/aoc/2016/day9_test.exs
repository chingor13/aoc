defmodule Aoc2016.Day9Test do
  use ExUnit.Case
  doctest Aoc2016.Day9
  alias Aoc2016.Day9
  @moduletag [day9: true, year2016: true]

  test "sample 1" do
    assert "ADVENT" == Day9.decompress("ADVENT")
    assert 6 == Day9.decompressed_length("ADVENT")
  end

  test "sample 2" do
    assert "ABBBBBC" == Day9.decompress("A(1x5)BC")
    assert 7 == Day9.decompressed_length("A(1x5)BC")
  end

  test "sample 3" do
    assert "XYZXYZXYZ" == Day9.decompress("(3x3)XYZ")
    assert 9 == Day9.decompressed_length("(3x3)XYZ")
  end

  test "sample 4" do
    assert "ABCBCDEFEFG" == Day9.decompress("A(2x2)BCD(2x2)EFG")
    assert 11 == Day9.decompressed_length("A(2x2)BCD(2x2)EFG")
  end

  test "sample 5" do
    assert "(1x3)A" == Day9.decompress("(6x1)(1x3)A")
    assert 6 == Day9.decompressed_length("(6x1)(1x3)A")
  end

  test "sample 6" do
    assert "X(3x3)ABC(3x3)ABCY" == Day9.decompress("X(8x2)(3x3)ABCY")
    assert 18 == Day9.decompressed_length("X(8x2)(3x3)ABCY")
  end

  test "v2 sample 1" do
    assert 9 == Day9.decompressed_length_v2("(3x3)XYZ")
  end

  test "v2 sample 2" do
    assert 20 == Day9.decompressed_length_v2("X(8x2)(3x3)ABCY")
  end

  test "v2 sample 3" do
    assert 241920 == Day9.decompressed_length_v2("(27x12)(20x12)(13x14)(7x10)(1x12)A")
  end

  test "v2 sample 4" do
    assert 445 == Day9.decompressed_length_v2("(25x3)(3x3)ABC(2x3)XY(5x2)PQRSTX(18x9)(3x2)TWO(5x7)SEVEN")
  end
end
