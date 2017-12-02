defmodule Aoc2016.Day7 do

  @ip7_pattern ~r/([a-z]+)\[([a-z]+)\]([a-z]+)/

  def supports_tls?(ip) do
    {others, hypernets} = detect_hypernets(ip)

    !Enum.any?(hypernets, &abba?/1) && Enum.any?(others, &abba?/1)
  end

  def detect_hypernets(ip) do
    {others, hypernets} = ip
    |> String.split(~r/\[([a-z]+)\]/, include_captures: true)
    |> Enum.with_index
    |> Enum.partition(fn({_, i}) -> 0 == rem(i, 2) end)

    {Enum.map(others, &(elem(&1, 0))), Enum.map(hypernets, &(elem(&1, 0)))}
  end

  def abba?(""), do: false
  def abba?(<<a::bytes-size(1)>> <> <<b::bytes-size(1)>> <> <<b::bytes-size(1)>> <> <<a::bytes-size(1)>> <> _rest) when a != b, do: true
  def abba?(<<_::bytes-size(1)>> <> rest) do
    abba?(rest)
  end

  def supports_ssl?(ip) do
    ip
    |> detect_hypernets
    |> ssl?
  end
  defp ssl?({others, hypernets}) do
    others
    |> Enum.flat_map(&all_aba/1)
    |> Enum.any?(fn(aba) -> has_bab?(hypernets, aba) end)
  end

  def all_aba(""), do: []
  def all_aba(<<a::bytes-size(1)>> <> <<b::bytes-size(1)>> <> <<a::bytes-size(1)>> <> rest) do
    [a <> b <> a | all_aba(b <> a <> rest)]
  end
  def all_aba(<<_::bytes-size(1)>> <> rest) do
    all_aba(rest)
  end

  def has_bab?(hypernets, aba) when is_list(hypernets) do
    Enum.any?(hypernets, fn(hypernet) -> has_bab?(hypernet, aba) end)
  end
  def has_bab?(hypernet, <<a::bytes-size(1)>> <> <<b::bytes-size(1)>> <> <<a::bytes-size(1)>>) do
    String.contains?(hypernet, b <> a <> b)
  end

end
