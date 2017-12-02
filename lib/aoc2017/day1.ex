defmodule Aoc2017.Day1 do

  def part1(n) when is_integer(n) do
    n
    |> Integer.digits()
    |> part1()
  end
  def part1(digits) do
    part1(digits, List.first(digits))
  end
  def part1([], _), do: 0
  def part1([a], a), do: a
  def part1([i | rest = [i | _]], first) do
    i + part1(rest, first)
  end
  def part1([_ | rest], first), do: part1(rest, first)

  def part2(n) when is_integer(n) do
    n
    |> Integer.digits
    |> part2
  end
  def part2(digits) do
    {group1, group2} = Enum.split(digits, div(length(digits), 2))

    part2(group1, group2)
  end

  def part2([], []), do: 0
  def part2([a | rest], [a | rest2]) do
    2 * a + part2(rest, rest2)
  end
  def part2([_ | rest], [_ | rest2]) do
    part2(rest, rest2)
  end

end
