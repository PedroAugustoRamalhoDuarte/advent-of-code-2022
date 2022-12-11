defmodule Day05Test do
  use ExUnit.Case
  doctest Day05

  test "Day5 Part1" do
    assert Day05.part1('./data/test/day05.txt') == "CMZ"
  end

  test "Day5 Part2" do
    assert Day05.part2('./data/test/day05.txt') == "MCD"
  end
end
