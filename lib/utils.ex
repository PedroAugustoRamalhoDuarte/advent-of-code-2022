defmodule Utils do
  def to_i(string) do
    Integer.parse(string) |> elem(0)
  end

  def file_lines(file_path) do
    File.read!(file_path)
    |> String.split("\n")
  end

  def to_ascii(string) do
    string |> String.to_charlist() |> hd
  end
end
