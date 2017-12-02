defmodule Aoc2016.Day10 do

  defstruct bots: %{}, outputs: %{}, trade_log: []

  defmodule Bot do
    defstruct id: nil, low: nil, high: nil, chips: []

    def receive(bot = %{chips: [val], high: high, low: low}, chip) do
      [lower, higher] = [val, chip] |> Enum.sort
      pushes = [
        {low, lower},
        {high, higher}
      ]
      IO.puts "bot #{bot.id} is pushing #{lower} -> #{elem(low, 0)} #{elem(low, 1)} and #{higher} -> #{elem(high, 0)} #{elem(high, 1)}"
      {:push, pushes, Map.put(bot, :chips, [])}
    end
    def receive(bot, chip) do
      {:ok, Map.update!(bot, :chips, fn(chips) -> [chip | chips] end)}
    end
  end

  def instruct(bots, instructions) do
    # sort instructions
    {setup_instructions, execute_instructions} = instructions
    |> Enum.partition(fn(instruction) -> String.starts_with?(instruction, "bot") end)

    bots
    |> setup(setup_instructions)
    |> execute(execute_instructions)
  end
  def setup(bots, instructions) when is_list(instructions) do
    Enum.reduce(instructions, bots, fn(instruction, acc) -> setup(acc, instruction) end)
  end
  def setup(bots, instruction) do
    with  [_, bot_string, low_recipient, low_string, high_recipient, high_string] <- Regex.run(~r/bot (\d+) gives low to (bot|output) (\d+) and high to (bot|output) (\d+)/, instruction),
          {bot_id, ""} <- Integer.parse(bot_string),
          {low, ""} <- Integer.parse(low_string),
          {high, ""} <- Integer.parse(high_string)
    do
      Map.put(bots, bot_id, %Bot{id: bot_id, low: {low_recipient, low}, high: {high_recipient, high}})
    end
  end
  def execute(bots, instructions) when is_list(instructions) do
    Enum.reduce(instructions, bots, fn(instruction, acc) -> execute(acc, instruction) end)
    bots
  end
  def execute(bots, instruction) do
    with  [_, value_string, bot_string] <- Regex.run(~r/value (\d+) goes to bot (\d+)/, instruction),
          {bot_id, ""} <- Integer.parse(bot_string),
          {value, ""} <- Integer.parse(value_string)
    do
      push(bots, bot_id, value)
    end
  end

  def push(bots, bot_id, value) do
    case Map.get(bots, bot_id)
    |> Bot.receive(value) do
      {:push, pushes, new_bot} ->
        new_bots = Map.put(bots, bot_id, new_bot)
        Enum.reduce(pushes, new_bots, fn(push, acc) -> new_push(acc, push) end)
      {:ok, new_bot} ->
        Map.put(bots, bot_id, new_bot)
    end
  end
  def new_push(bots, {{"bot", bot_id}, value}) do
    bots
    |> push(bot_id, value)
  end
  def new_push(bots, _), do: bots

end
