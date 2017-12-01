defmodule Aoc2017.Day1 do

  def part1(n) when is_integer(n), do: part1("#{n}")
  def part1(n) do
    digits = String.split(n, "", trim: true)
    first = List.first(digits)

    value(digits, first)
  end

  def value([], _), do: 0
  def value([a], a), do: int_val(a)
  def value([i | rest = [i | _]], first) do
    int_val(i) + value(rest, first)
  end
  def value([_ | rest], first), do: value(rest, first)

  defp int_val(a) do
    a
    |> Integer.parse
    |> elem(0)
  end

  def part2(n) when is_integer(n), do: part2("#{n}")
  def part2(n) do
    digits = String.split(n, "", trim: true)
    {group1, group2} = Enum.split(digits, Integer.floor_div(length(digits), 2))

    value2(group1, group2)
  end

  def value2([], []), do: 0
  def value2([a | rest], [a | rest2]) do
    2 * int_val(a) + value2(rest, rest2)
  end
  def value2([_ | rest], [_ | rest2]) do
    value2(rest, rest2)
  end

end
