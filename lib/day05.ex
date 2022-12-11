defmodule Day05 do
  def parse_line(line) do
    String.to_charlist(line)
    |> Enum.chunk_every(4)
    |> Enum.map(fn line -> to_string(line) |> String.replace(["[", "]", " "], "") end)
  end

  def stack_length(initial_state) do
    Enum.at(initial_state, -1)
    |> String.split(" ")
    |> Enum.at(-1)
    |> Utils.to_i()
  end

  def add_to_list(line, list) do
    Enum.with_index(line)
    |> Enum.reduce(list, fn {element, index}, acc ->
      if element != "",
        do: List.replace_at(acc, index, List.insert_at(Enum.at(acc, index), 0, element)),
        else: acc
    end)
  end

  def initialize_problem(initial_state) do
    list = List.duplicate([], stack_length(initial_state))

    List.pop_at(initial_state, -1)
    |> elem(1)
    |> Enum.reduce(list, fn line, list -> add_to_list(parse_line(line), list) end)
  end

  def make_move(move_list, list, part2) do
    [count, from, to] = move_list
    from = from - 1
    to = to - 1

    to_length = length(Enum.at(list, to))
    insert_at = if part2, do: to_length, else: -1

    {from_updated_stack, to_updated_stack} =
      Enum.reduce(0..(count - 1), {Enum.at(list, from), Enum.at(list, to)}, fn _index,
                                                                               {from_stack,
                                                                                to_stack} ->
        a = List.pop_at(from_stack, -1)
        b = List.insert_at(to_stack, insert_at, elem(a, 0))
        {elem(a, 1), b}
      end)

    list
    |> List.replace_at(from, from_updated_stack)
    |> List.replace_at(to, to_updated_stack)
  end

  def calculate(file, part2) do
    [initial_state, _, moves] =
      Utils.file_lines(file)
      |> Enum.chunk_by(&(&1 == ""))

    initial = initialize_problem(initial_state)

    Enum.reduce(moves, initial, fn line, state ->
      String.split(line, ["move", "from", "to"], trim: true)
      |> Enum.map(&String.trim/1)
      |> Enum.map(&Utils.to_i/1)
      |> make_move(state, part2)
    end)
    |> Enum.map(fn stack -> Enum.at(stack, -1) end)
    |> Enum.join()
  end

  def part1(file) do
    calculate(file, false)
  end

  def part2(file) do
    calculate(file, true)
  end
end
