defmodule Aoc2016.Day5Test do
  use ExUnit.Case
  doctest Aoc2016.Day5
  alias Aoc2016.Day5
  @moduletag [day5: true, year2016: true]

  test "example 1" do
    assert "18f47a30" == Day5.password_for_room("abc")
  end

  test "code_for_md5" do
    assert nil == Day5.code_for_md5("12345abcd")
    assert "8" == Day5.code_for_md5("000008f82")
  end

  test "interesting_hash" do
    assert "1" == Day5.interesting_hash("abc", 3231929)
  end

  test "interesting_hash_with_position" do
    assert {"5", 1} == Day5.interesting_hash_with_position("abc", 3231929)
  end

  test "code_and_position_for_md5" do
    assert nil == Day5.code_and_position_for_md5("000008f82")
    assert {"5", 1} == Day5.code_and_position_for_md5("000001522")
  end

  test "password with position" do
    assert "05ace8e3" == Day5.password_for_room_with_position("abc")
  end

end
