defmodule Aoc2017.Day2 do

  def part1(n) when is_binary(n) do
    n
    |> String.split("\n")
    |> part1
  end
  def part1(input) when is_list(input) do
    input
    |> Enum.map(fn row -> checksum(row) end)
    |> Enum.sum
  end

  def checksum(numbers) when is_binary(numbers) do
    numbers
    |> String.split()
    |> Enum.map(&int_val/1)
    |> checksum
  end
  def checksum([first | rest]) do
    checksum(rest, first, first)
  end
  def checksum([a | rest], min, max) do
    checksum(rest, min(a, min), max(a, max))
  end
  def checksum([], min, max), do: max - min

  def int_val(str) do
    str
    |> Integer.parse
    |> elem(0)
  end
  #
  # defp min(a, min) when a < min, do: a
  # defp min(_, min), do: min
  #
  # defp max(a, min) when a > min, do: a
  # defp max(_, min), do: min


  def part2(n) when is_integer(n), do: part2("#{n}")
  def part2(n) do
  end

end
