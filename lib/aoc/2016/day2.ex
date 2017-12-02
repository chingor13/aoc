defmodule Aoc2016.Day2 do

  @default_codepad {
    {"1", "2", "3"},
    {"4", "5", "6"},
    {"7", "8", "9"}
  }
  defstruct codepad: @default_codepad, position: {1, 1}

  def code(codepad, line) when is_binary(line), do: code(codepad, [line])

  def code(codepad, lines) do
    Enum.map_reduce(lines, {"", codepad}, &code_reduce/2)
    |> elem(1)
    |> elem(0)
  end
  defp code_reduce(line, {str, codepad}) do
    codepad = move(codepad, line)

    {:ok, num} = position_to_num(codepad)
    {line, {str <> num, codepad}}
  end

  def move(codepad, ""), do: codepad
  def move(codepad = %{position: {x, y}}, "U" <> rest) do
    codepad
    |> move_if_possible({x, y - 1})
    |> move(rest)
  end
  def move(codepad = %{position: {x, y}}, "D" <> rest) do
    codepad
    |> move_if_possible({x, y + 1})
    |> move(rest)
  end
  def move(codepad = %{position: {x, y}}, "L" <> rest) do
    codepad
    |> move_if_possible({x - 1, y})
    |> move(rest)
  end
  def move(codepad = %{position: {x, y}}, "R" <> rest) do
    codepad
    |> move_if_possible({x + 1, y})
    |> move(rest)
  end
  def move_if_possible(codepad, {x, y}) do
    with  {:ok, val} <- position_to_num(codepad, {x, y}),
          {:ok, _} <- valid_move?(val)
    do
      codepad
      |> Map.put(:position, {x, y})
    else
      {:error, _message} ->
        # IO.puts("not moving to #{x}, #{y}: #{message}")
        codepad
    end
  end
  def valid_move?(nil), do: {:error, "this space is nil"}
  def valid_move?(val), do: {:ok, val}

  def position_to_num(codepad), do: position_to_num(codepad, codepad.position)
  def position_to_num(%{codepad: codepad}, {x, y}) do
    with  {:ok, row} <- codepad_to_row(codepad, y),
          {:ok, val} <- row_to_num(row, x)
    do
      {:ok, val}
    end
  end
  defp codepad_to_row(codepad, y) when y < 0 or y >= tuple_size(codepad), do: {:error, "out of bounds"}
  defp codepad_to_row(codepad, y), do: {:ok, elem(codepad, y)}
  defp row_to_num(row, x) when x < 0 or x >= tuple_size(row), do: {:error, "out of bounds"}
  defp row_to_num(row, x), do: {:ok, elem(row, x)}

end
