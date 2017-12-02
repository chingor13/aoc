defmodule Aoc.Input do

  def read_matrix(file) do
    file
    |> read_rows()
    |> Enum.map(fn row -> String.codepoints(row) end)
  end

  def read_number_matrix(file) do
    file
    |> read_rows()
    |> Enum.map(&parse_number_row/1)
  end

  def read_digit_matrix(file) do
    file
    |> read_rows()
    |> Enum.map(&parse_digit_row/1)
  end

  def read_digits(file) do
    file
    |> file_contents()
    |> parse_digit_row()
  end

  def read_rows(file) do
    file
    |> file_contents()
    |> String.split("\n")
  end

  defp file_contents(file) do
    file
    |> File.read!
    |> String.trim
  end

  defp parse_number_row(row) do
    row
    |> String.split()
    |> Enum.map(&String.to_integer/1)
  end

  defp parse_digit_row(row) do
    row
    |> String.split("", trim: true)
    |> Enum.map(&String.to_integer/1)
  end

end
