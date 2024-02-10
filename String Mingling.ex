
defmodule Solution do
    def mingling([],[],str), do: str
    def mingling([p1|p],[q1|q], str) do
        mingling(p, q, str<>p1<>q1)
    end
    def solve(str) do
        [p,q]= String.split(str,"\n")
        mingling(String.graphemes(p), String.graphemes(q), "")
    end
end

IO.read(:all)
|> Solution.solve
|> IO.puts
