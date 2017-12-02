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

  def checksum([first | rest]) do
    checksum(rest, first, first)
  end
  def checksum([a | rest], min, max) do
    checksum(rest, min(a, min), max(a, max))
  end
  def checksum([], min, max), do: max - min

  def part2(n) when is_binary(n) do
    n
    |> String.split("\n")
    |> part2
  end
  def part2(input) when is_list(input) do
    input
    |> Enum.map(fn row -> divisor(row) end)
    |> Enum.sum
  end

  def divisor([]), do: nil
  def divisor([a | rest]) do
    case divisor(a, rest) do
      nil -> divisor(rest)
      a   -> a
    end
  end
  def divisor(_, []), do: nil
  def divisor(a, [b | rest]) when a > b do
    case rem(a, b) do
      0 -> div(a, b)
      _ -> divisor(a, rest)
    end
  end
  def divisor(a, [b | rest]) do
    case rem(b, a) do
      0 -> div(b, a)
      _ -> divisor(a, rest)
    end
  end

end
