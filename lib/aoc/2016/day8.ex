defmodule Aoc2016.Day8 do
  alias Aoc.Matrix
  alias Aoc.ListUtils

  def commands(matrix, commands) do
    Enum.reduce(commands, matrix, fn(command, m) -> command(m, command) end)
  end

  def command(matrix, "rect " <> size) do
    rect(matrix, size)
  end
  def command(matrix, "rotate row y=" <> rotation) do
    rotate_row(matrix, rotation)
  end
  def command(matrix, "rotate column x=" <> rotation) do
    rotate_column(matrix, rotation)
  end

  def total_lit_pixels(matrix) do
    Enum.reduce(matrix, 0, fn(row, acc) -> acc + Enum.sum(row) end)
  end

  def rect(matrix, size) do
    with  [_, x_str, y_str] <- Regex.run(~r/(\d+)x(\d+)/, size),
          {x, ""} <- Integer.parse(x_str),
          {y, ""} <- Integer.parse(y_str)
    do
      matrix
      |> rect(x, y)
    end
  end
  def rect(matrix, _x, 0), do: matrix
  def rect(matrix, x, y) do
    matrix
    |> List.update_at(y - 1, fn(row) -> ListUtils.fill_with(row, 1, x) end)
    |> rect(x, y - 1)
  end

  def rotate_row(matrix, rotation) do
    with  [_, row_str, amount_str] <- Regex.run(~r/(\d+)\sby\s(\d+)/, rotation),
          {row, ""} <- Integer.parse(row_str),
          {how_much, ""} <- Integer.parse(amount_str)
    do
      matrix
      |> rotate_row(row, how_much)
    end
  end
  def rotate_row(matrix, row, how_much) do
    matrix
    |> List.update_at(row, fn(data) -> ListUtils.shift(data, how_much) end)
  end

  def rotate_column(matrix, rotation) do
    matrix
    |> Matrix.transpose
    |> rotate_row(rotation)
    |> Matrix.transpose
  end
  def rotate_column(matrix, column, how_much) do
    matrix
    |> Matrix.transpose
    |> rotate_row(column, how_much)
    |> Matrix.transpose
  end

  def print(matrix) do
    matrix
    |> Enum.each(fn(row) -> row |> Enum.chunk(5) |> Enum.map(fn(row) -> Enum.join(row) |> String.replace("0", " ") end) |> Enum.join(" ") |> IO.puts end)
  end

end
