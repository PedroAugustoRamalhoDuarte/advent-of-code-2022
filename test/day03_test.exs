defmodule Day03Test do
  use ExUnit.Case
  doctest Day03

  test "Day3 Part1" do
    assert Day03.part1('./data/test/day03.txt') == 157
  end

  test "Day3 Part2" do
    assert Day03.part2('./data/test/day03.txt') == 70
  end
end
