defmodule Aoc2016.Day5 do

  def password_for_room(room) do
    Stream.iterate(0, &(&1 + 1))
    |> Stream.map(fn(x) -> interesting_hash(room, x) end)
    |> Stream.reject(fn(x) -> nil == x end)
    |> Enum.take(8)
    |> Enum.join
    |> String.downcase
  end

  defp md5(string) do
    :crypto.hash(:md5, string)
    |> Base.encode16()
  end
  def interesting_hash(room, int) do
    "#{room}#{int}"
    |> md5
    |> code_for_md5
  end
  def code_for_md5("00000" <> <<digit::bytes-size(1)>> <> _rest) do
    IO.puts "found interesting code: #{digit}"
    digit
  end
  def code_for_md5(_), do: nil

  def password_for_room_with_position(room) do
    Stream.iterate(0, &(&1 + 1))
    |> Stream.map(fn(x) -> interesting_hash_with_position(room, x) end)
    |> Stream.reject(fn(x) -> nil == x end)
    |> Stream.uniq(fn({_, pos}) -> pos end)
    |> Enum.take(8)
    |> Enum.sort_by(fn({_, pos}) -> pos end)
    |> Enum.map(fn({digit, _}) -> digit end)
    |> Enum.join
    |> String.downcase
  end

  def interesting_hash_with_position(room, int) do
    "#{room}#{int}"
    |> md5
    |> code_and_position_for_md5
  end
  def code_and_position_for_md5("00000" <> <<position::bytes-size(1)>> <> <<digit::bytes-size(1)>> <> _rest) do
    with  {int, ""} <- Integer.parse(position),
          true <- int < 8
    do
      {digit, int}
      |> IO.inspect
    else
      :error ->
        nil
      false ->
        nil
    end
  end
  def code_and_position_for_md5(_), do: nil

end
