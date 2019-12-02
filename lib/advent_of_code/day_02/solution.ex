defmodule AdventOfCode.Day02.Solution do
  def run() do
    list = read_and_process_input("/lib/advent_of_code/day_02/puzzle_input.txt")

    list = List.replace_at(list, 1, 12)
    list = List.replace_at(list, 2, 2)

    process(list, list, 0)
  end

  def run_part1() do
    list = read_and_process_input("/lib/advent_of_code/day_02/puzzle_input.txt")

   list =  update_list(list, 12, 2)
   process(list, list, 0)
  end

  def run_part2() do
    list = read_and_process_input("/lib/advent_of_code/day_02/puzzle_input.txt")

    for num1 <- 0..99, num2 <- 0..99 do
      list =  update_list(list, num1, num2)
      [head | _tail] = process(list, list, 0)
      if(head == 19_690_720) do
        IO.puts("num1: #{num1}, num2: #{num2}")
      end
    end

  end

  def create_rows() do
    Enum.reduce(0..99 - 1, [], fn(ord,acc) ->
      col = Enum.reduce(0..99 - 1, [], fn(abs, accu) ->
        [{abs,ord}|accu]
      end)
      |> Enum.reverse
      [col | acc]
    end)
    |> Enum.reverse
  end

  defp update_list(list, num1, num2) do
    list
    |> List.replace_at(1, num1)
    |> List.replace_at(2, num2)
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

  def read_and_process_input(rel_path) do
    filepath = File.cwd!() <> rel_path

    filepath
    |> File.read!()
    |> String.split(",")
    |> Enum.map(fn x -> String.to_integer(x) end)
  end
end
