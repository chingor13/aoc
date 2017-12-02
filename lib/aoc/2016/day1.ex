defmodule Aoc2016.Day1 do
  defstruct direction: :north, x: 0, y: 0, visited: nil, first_revisited: nil

  def new() do
    %__MODULE__{}
    |> Map.put(:visited, MapSet.new)
    |> visit!(0, 0)
  end

  def move(position, []), do: position
  def move(position, [head | tail]) do
    position
    |> move(head)
    |> move(tail)
  end
  def move(position, "R" <> moves) do
    position
    |> turn_right
    |> advance(moves)
  end
  def move(position, "L" <> moves) do
    position
    |> turn_left
    |> advance(moves)
  end

  def turn_right(position = %{direction: :north}),  do: Map.put(position, :direction, :east)
  def turn_right(position = %{direction: :east}),   do: Map.put(position, :direction, :south)
  def turn_right(position = %{direction: :south}),  do: Map.put(position, :direction, :west)
  def turn_right(position = %{direction: :west}),   do: Map.put(position, :direction, :north)

  def turn_left(position = %{direction: :north}), do: Map.put(position, :direction, :west)
  def turn_left(position = %{direction: :east}),  do: Map.put(position, :direction, :north)
  def turn_left(position = %{direction: :south}), do: Map.put(position, :direction, :east)
  def turn_left(position = %{direction: :west}),  do: Map.put(position, :direction, :south)

  def advance(position, 0), do: position
  def advance(position = %{x: cur_x, y: cur_y, direction: direction}, moves) when is_integer(moves) do
    {x, y} = advance_vector(direction)
    new_x = cur_x + x
    new_y = cur_y + y

    position
    |> check_revisit(new_x, new_y)
    |> visit!(new_x, new_y)
    |> advance(moves - 1)
  end
  def advance(position, moves) do
    {steps, _} = Integer.parse(moves)
    advance(position, steps)
  end
  defp advance_vector(:north), do: {0, 1}
  defp advance_vector(:east),  do: {1, 0}
  defp advance_vector(:south), do: {0, -1}
  defp advance_vector(:west),  do: {-1, 0}

  def distance(nil), do: nil
  def distance({x, y}), do: distance(x, y)
  def distance(position), do: distance(position.x, position.y)
  def distance(x, y), do: abs(x) + abs(y)

  def check_revisit(position = %{first_revisited: nil}, x, y) do
    revisited = case visited?(position, x, y) do
      true ->
        IO.puts("already visited: #{x}, #{y}")
        {x, y}
      _ ->
        nil
    end
    position
    |> Map.put(:first_revisited, revisited)
  end
  def check_revisit(position, _, _), do: position
  def visited?(position, x, y) do
    MapSet.member?(position.visited, {x, y})
  end
  def visit!(position, x, y) do
    position
    |> Map.update(:visited, MapSet.new, fn(ms) -> MapSet.put(ms, {x, y}) end)
    |> Map.put(:x, x)
    |> Map.put(:y, y)
  end
end
