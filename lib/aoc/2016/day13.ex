defmodule Aoc2016.Day13 do

  def generate_board(width, height, multiplier) do
    generate_board(width, height, multiplier, &open_value/3)
  end
  def generate_board(width, height, multiplier, generator) do
    0..(height - 1)
    |> Enum.map(fn(y) -> generate_row(width, y, multiplier, generator) end)
  end
  defp generate_row(width, y, multiplier, generator) do
    0..(width - 1)
    |> Enum.map(fn(x) -> generator.(x, y, multiplier) end)
  end

  def open_value(x, y, number) do
    x*x + 3*x + 2*x*y + y + y*y + number
    |> Convertat.to_base(2)
    |> String.codepoints
    |> Enum.count(fn(x) -> x == "1" end)
    |> rem(2)
  end
  def open?(x, y, number) do
    open_value(x, y, number)
    |> open?
  end
  def open?(0), do: true
  def open?(_), do: false
  def open?(board, {_x, y}) when y >= length(board) or y < 0, do: false
  def open?([row | _tail], {x, _y}) when x >= length(row) or x < 0, do: false
  def open?(board, {x, y}) do
    Enum.at(Enum.at(board, y), x) == 0
  end

  def shortest_route(board, from, to) do
    shortest_route(board, MapSet.new, from, to)
  end

  def shortest_route(_board, _visited, {x, y}, {x, y}), do: 0
  def shortest_route(board, visited, from, to) do
    open_neighbors(board, from)
    |> Enum.reject(fn(neighbor) -> MapSet.member?(visited, neighbor) end)
    |> min_route(board, visited, to)
  end

  def min_route([], _, _, _), do: :infinity
  def min_route(neighbors, board, visited, to) do
    neighbors
    |> Enum.map(fn(neighbor) -> shortest_route(board, MapSet.put(visited, neighbor), neighbor, to) end)
    |> Enum.min
    |> plus_one
  end
  defp plus_one(:infinity), do: :infinity
  defp plus_one(x), do: x + 1

  def open_neighbors(board, {x, y}) do
    [
      {x + 1, y},
      {x - 1, y},
      {x, y + 1},
      {x, y - 1}
    ]
    |> Enum.filter(fn(neighbor) -> open?(board, neighbor) end)
  end

  def distinct_visitable_locations(board, start, steps) do
    distinct_visitable_locations(board, MapSet.new, start, steps)
  end
  def distinct_visitable_locations(_board, visited, start, 0), do: MapSet.put(visited, start)
  def distinct_visitable_locations(board, visited, start, steps) do
    open_neighbors(board, start)
    |> Enum.reject(fn(neighbor) -> MapSet.member?(visited, neighbor) end)
    |> Enum.map(fn(neighbor) -> distinct_visitable_locations(board, MapSet.put(visited, neighbor), neighbor, steps - 1) end)
    |> Enum.reduce(MapSet.new, &MapSet.union/2)
    |> MapSet.put(start)
  end

end
