defmodule Solution do
    def permute(elements) do
        elements
        |>String.codepoints
        |>Enum.chunk_every(2)
        |>Enum.flat_map(fn [a, b] -> [b, a] end)
        |>Enum.join()
    end
end

input = IO.read(:stdio, :all)
  |> String.split("\n")
  
[_ | elements] = input
Enum.each(elements, fn e -> Solution.permute(e) |> IO.puts end)
