defmodule Aoc2016.Day3 do

  def valid_triangle?([a, b, c]), do: valid_triangle?(a, b, c)
  def valid_triangle?({a, b, c}), do: valid_triangle?(a, b, c)
  def valid_triangle?(_), do: false
  def valid_triangle?(a, b, c) when a + b <= c or a + c <= b or b + c <= a, do: false
  def valid_triangle?(_, _, _), do: true

  def num_valid_triangles(list) do
    list
    |> Enum.count(&valid_triangle?/1)
  end

  def in_groups_of(list, size) when length(list) > size do
    {slice, rest} = Enum.split(list, size)
    [slice | in_groups_of(rest, size)]
  end
  def in_groups_of(list, _size), do: [list]

  def transpose([[a, b, c], [d, e, f], [g, h, i]]) do
    [
      [a, d, g],
      [b, e, h],
      [c, f, i]
    ]
  end

end
