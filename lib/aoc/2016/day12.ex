defmodule Aoc2016.Day12 do

  defstruct line: 0, registers: %{"a" => 0, "b" => 0, "c" => 0, "d" => 0}

  def follow_instructions(storage = %{line: line}, instructions) when line >= length(instructions), do: storage
  def follow_instructions(storage = %{line: line}, instructions) do
    storage
    |> instruct(Enum.at(instructions, line))
    |> follow_instructions(instructions)
  end

  def instruct(storage, "cpy " <> stuff) do
    copy(storage, stuff)
    |> inc_line
  end
  def instruct(storage, "inc " <> register) do
    inc(storage, register)
    |> inc_line
  end
  def instruct(storage, "dec " <> register) do
    dec(storage, register)
    |> inc_line
  end
  def instruct(storage, "jnz " <> <<register::bytes-size(1)>> <> " " <> how_many_str) do
    {how_many, ""} = Integer.parse(how_many_str)
    jnz(storage, register, how_many)
  end

  def copy(storage, command) do
    with  [val_str, store] <- String.split(command),
          val <- parse_value(storage, val_str)
    do
      storage
      |> set_register(store, val)
    end
  end
  def parse_value(%{registers: %{"a" => a}}, "a"), do: a
  def parse_value(%{registers: %{"b" => b}}, "b"), do: b
  def parse_value(%{registers: %{"c" => c}}, "c"), do: c
  def parse_value(%{registers: %{"d" => d}}, "d"), do: d
  def parse_value(_, str) do
    Integer.parse(str)
    |> elem(0)
  end

  def set_register(storage, register, value) do
    Map.update!(storage, :registers, fn(registers) -> Map.put(registers, register, value) end)
  end
  def get_register(%{registers: registers}, register) do
    Map.get(registers, register)
  end

  def inc(storage, register, how_many \\ 1) do
    val = get_register(storage, register)
    set_register(storage, register, val + how_many)
  end
  def dec(storage, register, how_many \\ 1) do
    val = get_register(storage, register)
    set_register(storage, register, val - how_many)
  end

  def jnz(storage, register_str, how_many) when is_binary(register_str) do
    value = parse_value(storage, register_str)
    jnz(storage, value, how_many)
  end
  def jnz(storage, register, how_many_str) when is_binary(how_many_str) do
    {how_many, ""} = Integer.parse(how_many_str)
    jnz(storage, register, how_many)
  end
  def jnz(storage, 0, _how_many) do
    storage
    |> inc_line
  end
  def jnz(storage, _, how_many) do
    storage
    |> inc_line(how_many)
  end

  def inc_line(storage, how_many \\ 1) do
    Map.update(storage, :line, 0, &(&1 + how_many))
  end

end
