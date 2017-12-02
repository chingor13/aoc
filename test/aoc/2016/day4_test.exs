defmodule Aoc2016.Day4Test do
  use ExUnit.Case
  doctest Aoc2016.Day4
  @moduletag [day4: true, year2016: true]

  test "example 1" do
    assert Aoc2016.Day4.real_room?("aaaaa-bbb-z-y-x-123[abxyz]")
  end

  test "example 2" do
    assert Aoc2016.Day4.real_room?("a-b-c-d-e-f-g-h-987[abcde]")
  end

  test "example 3" do
    assert Aoc2016.Day4.real_room?("not-a-real-room-404[oarel]")
  end

  test "example 4" do
    refute Aoc2016.Day4.real_room?("totally-real-room-200[decoy]")
  end

  test "generating checksum" do
    assert "oarel" == Aoc2016.Day4.Room.calculate_checksum("not-a-real-room")
  end

  test "shift_cypher" do
    assert "very encrypted name" == Aoc2016.Day4.shift_cypher("qzmt-zixmtkozy-ivhz", 343)
  end

  test "decoded name" do
    room = Aoc2016.Day4.parse("qzmt-zixmtkozy-ivhz-343[abcde]")
    assert "very encrypted name" == Aoc2016.Day4.Room.decoded_name(room)
  end

end
