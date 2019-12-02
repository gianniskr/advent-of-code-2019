defmodule AdventOfCode.Day02.Solution do
  def run() do
    list =
      read("/lib/advent_of_code/day_02/puzzle_input.txt")
      |> process_input()

    list = List.replace_at(list, 1, 12)
    list = List.replace_at(list, 2, 2)

    process(list, list, 0)
  end

  def process([99 | _rest], list, _index) do
    list
  end

  def process([1, pos1, pos2, register | rest], list, index) do
    sum = Enum.at(list, pos1) + Enum.at(list, pos2)
    list = List.replace_at(list, register, sum)
    process(rest, list, index + 4)
  end

  def process([2, pos1, pos2, register | rest], list, index) do
    sum = Enum.at(list, pos1) * Enum.at(list, pos2)
    list = List.replace_at(list, register, sum)
    process(rest, list, index + 4)
  end

  def read(rel_path) do
    filepath = File.cwd!() <> rel_path

    filepath
    |> File.read!()
  end

  def process_input(input) do
    input
    |> String.split(",")
    |> Enum.map(fn x -> String.to_integer(x) end)
  end
end
