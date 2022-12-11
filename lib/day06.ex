defmodule Day06 do
  def duplicated_char(string, init, finish) do
    substring = String.slice(string, init..finish) |> String.to_charlist()

    if substring == Enum.uniq(substring),
      do: finish,
      else: duplicated_char(string, init + 1, finish + 1)
  end

  def part1(string) do
    duplicated_char(string, 0, 4)
  end

  def part2(string) do
    duplicated_char(string, 0, 14)
  end
end
