defmodule M do
  @doc """
  Reads everything provided to program from standard input
  """
  @spec read() :: chardata() | nodata()
  def read do
    IO.read(:stdio, :all)
  end

  @doc """
  Converts raw string of integers, each on a new line, into a List

  ## Examples
  iex> M.input_to_list("+5\n-3\n+4")
  [5, -3, 4]
  """
  @spec input_to_list(String.t()) :: list()
  def input_to_list(input) do
    input
    |> String.split()
    |> Enum.map(&Integer.parse/1)
    |> Enum.map(&elem(&1, 0))
  end

  @doc """
  Sums up all values in provided list.

  ## Examples
  iex> M.calculate([5,-3,4], 0)
  6
  """
  @spec calculate(list(), integer()) :: integer()
  def calculate([head | tail], acc) do
    calculate(tail, acc + head)
  end

  # finish
  def calculate([], acc), do: acc
end

IO.inspect(M.read() |> M.input_to_list() |> M.calculate(0))
