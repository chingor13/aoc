defmodule Aoc.ListUtils do

  def rotate(list, how_much) do
    len = length(list)
    shift = rem(how_much, len)

    {first, last} = Enum.split(list, shift)
    last ++ first
  end

  def shift(list, how_much) do
    len = length(list)
    shift = len - rem(how_much, len)

    {first, last} = Enum.split(list, shift)
    last ++ first
  end

  def generate(what, how_many) do
    Enum.map(:lists.seq(1, how_many), fn(x) -> what end)
  end

  def fill_with(list, what, how_many) do
    {_, last} = Enum.split(list, how_many)
    generate(what, how_many) ++ last
  end

end
