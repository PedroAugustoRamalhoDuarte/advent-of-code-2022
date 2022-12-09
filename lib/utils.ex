defmodule Utils do
  def file_lines(file_path) do
    File.read!(file_path)
    |> String.split("\n")
  end
end
