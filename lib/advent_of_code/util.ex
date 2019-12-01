defmodule AdventOfCode.Util do

  def read(rel_path) do
    filepath =File.cwd!() <> rel_path

    filepath
    |> File.read!()
    |> String.split("\r\n", trim: true)
  end
end
