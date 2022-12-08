defmodule Day02 do

  def choose_points(choose) do
    case choose do
      "X" -> 1
      "Y" -> 2
      "Z" -> 3
    end
  end

  def duel_points(other, mine) do
    cond do
      (mine == "X" && other == "A") || (mine == "Y" && other == "B") || (mine == "Z" && other == "C") ->
        3
      (mine == "Z" && other == "B") || (mine == "Y" && other == "A") || (mine == "X" && other == "C") ->
        6
      true ->
        0
    end
  end

  def calculate(line, points) do
    [other_choose, mine_choose] = String.split(line, " ")
    points + duel_points(other_choose, mine_choose) + choose_points(mine_choose)
  end

  def score(file) do
    File.read!(file)
    |> String.split("\n")
    |> Enum.reduce(0, fn line, points -> calculate(line, points) end)
  end
end
