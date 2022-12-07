defmodule Day01 do

  def say_hi do
    IO.puts "Hello!"
  end

end

defmodule Day01Test do
  use ExUnit.Case

  test "" do
    assert Day01.hello() == :world
  end
end

#MyTestScript.say_hi