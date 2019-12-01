defmodule AdventOfCode.Day01.Solution do

  def read() do
    list = AdventOfCode.Util.read("/lib/advent_of_code/day_01/puzzle_input.txt")
    Enum.reduce(list, 0, fn x, acc -> calc(String.to_integer(x)) + acc end)
  end



  defp calc(mass) do
     Integer.floor_div(mass, 3) - 2
  end

end
