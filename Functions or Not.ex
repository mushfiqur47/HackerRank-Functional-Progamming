defmodule Solution do
 def main(cases, rest, acc ) when cases<=1 do
    {ans, _} = solve(rest)
    acc++[ans]
 end

 def main(cases, rest, acc) do
    {ans, rest} = solve(rest)
    main(cases-1, rest, acc++[ans])
 end

 def solve([n | rest]) do
    pairs = Enum.take(rest, String.to_integer(n))
    {is_function?(pairs), rest--pairs}
 end

 def is_function?(pairs) do
    map = Enum.reduce(pairs, %{},fn p,acc -> 
        [l,r] = String.split(p)
        Map.get_and_update(acc, l, fn value ->
        {value,
         case value do
           nil -> [r]
           v -> v ++ [r]
         end
         |> Enum.uniq()}
      end)
      |> elem(1)
    end) 
    map
    |> Map.values()
    |> Enum.all?(fn x -> length(x) == 1 end)
 end
 
 def puts_ans(b) do
    case b do
        true -> "YES"
        _ -> "NO"
    end
 end

end

[cases | rest] = IO.read(:all) |> String.split("\n")
Solution.main(String.to_integer(cases), rest, [])
|> Enum.map(&Solution.puts_ans/1)
|> Enum.join("\n")
|> IO.puts
