defmodule Day04Test do
  use ExUnit.Case
  doctest Day04

  test "Day4 Part1" do
    assert Day04.part1('./data/test/day04.txt') == 2
  end

#  test "Day4 Part2" do
#    assert Day04.part2('./data/test/day04.txt') == 70
#  end
end
