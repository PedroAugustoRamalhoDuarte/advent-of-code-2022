defmodule Day03 do
  def char_score(char) do
    cond do
      Utils.to_ascii(char) >= Utils.to_ascii("a") ->
        Utils.to_ascii(char) - Utils.to_ascii("a") + 1

      true ->
        Utils.to_ascii(char) - Utils.to_ascii("A") + 27
    end
  end

  def line_score(line, score) do
    split_regex = Regex.compile!(".{#{floor(String.length(line) / 2)}}")
    [first, second] = String.split(line, split_regex, include_captures: true, trim: true)

    Enum.filter(String.codepoints(first), fn x -> String.contains?(second, x) end)
    |> Enum.uniq()
    |> Enum.at(0)
    |> char_score
    |> Kernel.+(score)
  end

  def part1(file) do
    Utils.file_lines(file)
    |> Enum.reduce(0, fn line, score -> line_score(line, score) end)
  end

  def part2(file) do
    Utils.file_lines(file)
  end
end
