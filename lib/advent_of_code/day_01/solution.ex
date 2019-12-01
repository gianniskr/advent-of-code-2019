defmodule AdventOfCode.Day01.Solution do

  def read() do
    list = AdventOfCode.Util.read("/lib/advent_of_code/day_01/puzzle_input.txt")
    Enum.reduce(list, 0, fn x, acc -> calc(String.to_integer(x), 0) + acc end)
  end

  def calc(mass, total_mass) when mass <= 0, do: total_mass

  def calc(mass, total_mass) do
     res = Integer.floor_div(mass, 3) - 2
     total_mass = if res > 0, do: total_mass + res, else: total_mass
     calc(res, total_mass)
  end

end
