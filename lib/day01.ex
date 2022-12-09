defmodule Day01 do
  def calculate("", max, current) when is_list(max) do
    max = if current > Enum.min(max), do: List.replace_at(max, Enum.find_index(max, fn x -> x == Enum.min(max) end), current), else: max
    {max, 0}
  end

  def calculate("", max, current) do
    max = if current > max, do: current, else: max
    {max, 0}
  end

  def calculate(line, max, current) do
    current = current + (Integer.parse(line) |> elem(0))
    {max, current}
  end

  def most_calories(file) do
    Utils.file_lines(file)
    |> Enum.reduce({0, 0}, fn line, {max, current} -> calculate(line, max, current) end)
    |> elem(0)
  end

  def top_3_calories(file) do
    Utils.file_lines(file)
    |> Enum.reduce({[0, 0, 0], 0}, fn line, {max, current} -> calculate(line, max, current) end)
    |> elem(0)
    |> Enum.sum
  end
end
