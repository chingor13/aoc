defmodule Aoc2016.Day6 do

  def message(lines) do
    lines
    |> Enum.map(&String.codepoints/1)
    |> transpose
    |> Enum.map(&most_common_letter/1)
    |> Enum.join
  end

  def least_common_message(lines) do
    lines
    |> Enum.map(&String.codepoints/1)
    |> transpose
    |> Enum.map(&least_common_letter/1)
    |> Enum.join
  end

  def transpose(m) do
    List.zip(m)
    |> Enum.map(&Tuple.to_list/1)
  end

  def most_common_letter(string) when is_binary(string), do: most_common_letter(String.codepoints(string))
  def most_common_letter(letters) do
    letters
    |> Enum.group_by(&(&1))
    |> Enum.sort_by(&mapper/1, &comparer/2)
    |> List.first
    |> elem(0)
  end
  defp mapper({_k, v}) do
    length(v)
  end
  defp comparer(a, b) do
    a >= b
  end

  def least_common_letter(string) when is_binary(string), do: least_common_letter(String.codepoints(string))
  def least_common_letter(letters) do
    letters
    |> Enum.group_by(&(&1))
    |> Enum.sort_by(&mapper/1, &least_comparer/2)
    |> List.first
    |> elem(0)
  end
  defp least_comparer(a, b) do
    b >= a
  end

end
