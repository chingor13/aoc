defmodule Aoc.Matrix do

  def new_matrix(columns, rows, val \\ 0) do
    for n <- 1 .. rows, do: generate_row(columns, val)
  end
  defp generate_row(size, val) do
    Enum.map(:lists.seq(1, size), fn(x) -> val end)
  end

  def transpose(m) do
    List.zip(m)
    |> Enum.map(&Tuple.to_list/1)
  end

end
