defmodule Day02 do
  @lose "X"
  @win "Z"
  @draw "Y"
  @rock 1
  @paper 2
  @scissor 3

  def to_ascii(string) do
    string |> String.to_charlist |> hd
  end

  def translate(choose) do
    cond do
      to_ascii(choose) >= to_ascii("X") ->
        to_ascii(choose) - to_ascii("X") + 1
      true ->
        to_ascii(choose) - to_ascii("A") + 1
    end
  end

  def choose_points(choose) do
    case choose do
      @rock -> 1
      @paper -> 2
      @scissor -> 3
    end
  end

  def duel_points(other, mine) do
    cond do
      (mine == other) ->
        3
      (mine == @scissor && other == @paper) || (mine == @paper && other == @rock) || (mine == @rock && other == @scissor) ->
        6
      true ->
        0
    end
  end

  def duel_points2(_other, mine) do
    case mine do
      "X" -> 0
      "Y" -> 3
      "Z" -> 6
    end
  end

  def my_choose(other_choose, lose_or_win) do
    cond do
      lose_or_win == @draw ->
        other_choose
      (lose_or_win == @lose && other_choose == @rock) || (lose_or_win == @win && other_choose == @paper) ->
        @scissor
      (lose_or_win == @lose && other_choose == @scissor) || (lose_or_win == @win && other_choose == @rock) ->
        @paper
      (lose_or_win == @lose && other_choose == @paper) || (lose_or_win == @win && other_choose == @scissor) ->
        @rock
    end
  end

  def calculate(line, points) do
    [other_choose, mine_choose] = String.split(line, " ")
    other_choose = translate(other_choose)
    mine_choose = translate(mine_choose)
    points + duel_points(other_choose, mine_choose) + choose_points(mine_choose)
  end

  def calculate2(line, points) do
    [other_choose, lose_or_win] = String.split(line, " ")
    other_choose = translate(other_choose)
    points + duel_points2(other_choose, lose_or_win) + choose_points(my_choose(other_choose, lose_or_win))
  end

  def score(file) do
    File.read!(file)
    |> String.split("\n")
    |> Enum.reduce(0, fn line, points -> calculate(line, points) end)
  end

  def part2(file) do
    File.read!(file)
    |> String.split("\n")
    |> Enum.reduce(0, fn line, points -> calculate2(line, points) end)
  end
end
