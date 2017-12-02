defmodule Aoc2016.Day7Test do
  use ExUnit.Case
  doctest Aoc2016.Day7
  @moduletag [day7: true, year2016: true]

  test "tls sample data - abba outside hypernet" do
    assert Aoc2016.Day7.supports_tls?("abba[mnop]qrst")
  end

  test "tls sample data - abba in hypernet" do
    refute Aoc2016.Day7.supports_tls?("abcd[bddb]xyyx")
  end

  test "tls sample data - invalid abba" do
    refute Aoc2016.Day7.supports_tls?("aaaa[qwer]tyui")
  end

  test "tls sample data - larger string" do
    assert Aoc2016.Day7.supports_tls?("ioxxoj[asdfgh]zxcvbn")
  end

  test "tls sample data - multiple hypernets" do
    refute Aoc2016.Day7.supports_tls?("abcd[fofo]asdf[bddb]xyyx")
    refute Aoc2016.Day7.supports_tls?("abcd[bddb]asdf[fofo]xyyx")
    assert Aoc2016.Day7.supports_tls?("abcd[asdf]abba[mnop]qrst")
  end

  test "ssl sample data - aba & bab" do
    assert Aoc2016.Day7.supports_ssl?("aba[bab]xyz")
  end

  test "ssl sample data - aba, no bab" do
    refute Aoc2016.Day7.supports_ssl?("xyx[xyx]xyx")
  end

  test "ssl sample data - irrelevant aba" do
    assert Aoc2016.Day7.supports_ssl?("aaa[kek]eke")
  end

  test "ssl sample data - overlap" do
    assert Aoc2016.Day7.supports_ssl?("zazbz[bzb]cdb")
  end

  test "all_aba" do
    assert ["zaz", "zbz"] == Aoc2016.Day7.all_aba("zazbz")
  end

end
