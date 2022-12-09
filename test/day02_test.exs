defmodule Day02Test do
  use ExUnit.Case
  doctest Day02

  test "Day2 Part1" do
    assert Day02.score('./data/test/day02.txt') == 15
  end

#  test "Day2 Part2" do
#    assert Day02.part2('./data/test/day02.txt') == 12
#  end
end
