defmodule Day07 do
  @limit 10000

  def parse_command(command, system, sum) do
  end

  def part1(file) do
    Utils.file_lines(file)
    |> Enum.reduce({[], 0}, fn command, {system, sum} -> parse_command(command, system, sum) end)
  end

  #  def part2(string) do
  #    duplicated_char(string, 0, 14)
  #  end
end
