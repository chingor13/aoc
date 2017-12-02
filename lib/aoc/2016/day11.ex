defmodule Aoc2016.Day11 do

  def num_steps(list_of_floors) do
    list_of_floors
    |> Enum.reduce({0, 0}, &reduce_floor/2)
    |> IO.inspect
  end
  defp reduce_floor(items_of_floor, {total, previous_items}) do
    item_count = length(items_of_floor) + previous_items
    {total + 2 * (item_count - 2) + 1, item_count}
  end

end
