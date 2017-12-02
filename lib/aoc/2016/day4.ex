defmodule Aoc2016.Day4 do
  @room_pattern ~r/([a-z\-]*)-(\d+)\[([a-z]{5})\]/

  defmodule Room do
    defstruct name: "", letters: %{}, id: nil, checksum: nil

    def real_room?(%Room{name: name, checksum: checksum}) do
      checksum == calculate_checksum(name)
    end

    def calculate_checksum(%Room{name: name}), do: calculate_checksum(name)
    def calculate_checksum(name) do
      name
      |> String.codepoints
      |> Enum.group_by(&(&1))
      |> Map.delete("-")
      |> Enum.sort_by(&mapper/1, &comparer/2)
      |> Enum.map(fn({letter, _}) -> letter end)
      |> Enum.take(5)
      |> Enum.join()
    end
    defp mapper({_k, v}) do
      length(v)
    end
    defp comparer(a, b) do
      a >= b
    end

    def decoded_name(%{name: name, id: id}) do
      Aoc2016.Day4.shift_cypher(name, id)
    end
  end

  def parse(string) do
    with  [_, name, id_str, checksum] <- Regex.run(@room_pattern, string),
          {id, ""} <- Integer.parse(id_str)
    do
      %Room{name: name, id: id, checksum: checksum}
    else
      _ ->
        nil
    end
  end

  def real_room?(string) do
    string
    |> parse
    |> Room.real_room?
  end

  def shift_cypher(string, num) do
    cypher = build_cypher(num)
    string
    |> String.codepoints
    |> Enum.map(fn(letter) -> Map.get(cypher, letter) end)
    |> Enum.join
  end
  defp build_cypher(num) do
    letters = "abcdefghijklmnopqrstuvwxyz"
    |> String.codepoints
    len = length(letters)
    real_shift = rem(num, len)

    {first, last} = Enum.split(letters, real_shift)
    cypher = last ++ first

    Enum.zip(letters, cypher)
    |> Enum.into(%{})
    |> Map.put("-", " ")
  end

end
