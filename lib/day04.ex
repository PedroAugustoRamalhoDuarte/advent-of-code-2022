defmodule Day04 do
  def fully_contain(line, count) do
    [first, second] =
      String.split(line, ",")
      |> Enum.map(fn line -> String.split(line, "-") end)
      |> Enum.map(fn line -> Utils.to_i(Enum.at(line, 0))..Utils.to_i(Enum.at(line, 1)) end)
      |> Enum.map(fn line -> Enum.to_list(line) |> MapSet.new() end)

    if MapSet.subset?(first, second) || MapSet.subset?(second, first),
      do: count + 1,
      else: count
  end

  def part1(file) do
    Utils.file_lines(file)
    |> Enum.reduce(0, fn line, count -> fully_contain(line, count) end)
  end

  def part2(file) do
    #    Utils.file_lines(file)
    #    |> Enum.chunk_every(3)
    #    |> Enum.reduce(0, fn line, score -> chunk_score(line, score) end)
  end
end
