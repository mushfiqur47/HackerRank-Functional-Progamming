

defmodule Arr do
  def count(arr) do
    c(arr, 0)
  end

  def c([_ | tail], acc) do
    c(tail, acc + 1)
  end

  def c([], acc) do
    acc
  end
end

defmodule Solution do
  IO.read(:all)
  |> String.split
  |> Enum.map(&String.to_integer/1)
  |> Arr.count
  |> IO.puts
end
