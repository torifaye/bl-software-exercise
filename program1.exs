defmodule M do
  def read do
    IO.read(:stdio, :all)
  end

  def input_to_list(input) do
    input
    |> String.split()
    |> Enum.map(&Integer.parse/1)
    |> Enum.map(&elem(&1, 0))
  end

  def calculate([head | tail], acc) do
    calculate(tail, acc + head)
  end

  # finish
  def calculate([], acc), do: acc
end

IO.inspect(M.read() |> M.input_to_list() |> M.calculate(0))
