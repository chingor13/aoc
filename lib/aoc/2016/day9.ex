defmodule Aoc2016.Day9 do

  def decompress(""), do: ""
  def decompress("(" <> rest) do
    with  [_, next_character_str, times_str, post] <- Regex.run(~r/(\d+)x(\d+)\)(.*)/, rest),
          {next_character_count, ""} <- Integer.parse(next_character_str),
          {times, ""} <- Integer.parse(times_str),
          <<a::bytes-size(next_character_count)>> <> remainder <- post,
          calculated <- Aoc.ListUtils.generate(a, times) |> Enum.join
    do
      calculated <> decompress(remainder)
    end
  end
  def decompress(<<a::bytes-size(1)>> <> rest) do
    a <> decompress(rest)
  end

  def decompressed_length(string) do
    string
    |> decompress
    |> String.length
  end

  def decompressed_length_v2(""), do: 0
  def decompressed_length_v2("(" <> rest) do
    with  [_, next_character_str, times_str, post] <- Regex.run(~r/(\d+)x(\d+)\)(.*)/, rest),
          {next_character_count, ""} <- Integer.parse(next_character_str),
          {times, ""} <- Integer.parse(times_str)
    do
      <<next::bytes-size(next_character_count)>> <> rest = post
      times * decompressed_length_v2(next) + decompressed_length_v2(rest)
    end
  end
  def decompressed_length_v2(<<_::bytes-size(1)>> <> rest) do
    1 + decompressed_length_v2(rest)
  end

end
