defmodule Day01Test do
  use ExUnit.Case
  doctest Day01

  test "Day1 Part1" do
    assert Day01.most_calories('./data/test/day01.txt') == 24000
  end

  test "Day1 Part2" do
    assert Day01.top_3_calories('./data/test/day01.txt') == 45000
  end
end
