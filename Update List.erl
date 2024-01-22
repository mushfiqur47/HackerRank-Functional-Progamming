
-module(solution).
-export([main/0]).

read(NewList) -> 
    case io:fread("", "~d") of 
        {ok, [NewElement]} -> 
            read(NewList ++ [NewElement]);
        _ -> 
            NewList end. 

absValue(X) when X >= 0 ->
    X;
absValue(X) when X < 0 ->
    X * -1;
absValue(_) ->
    ok.

main() ->
    List = read([]),
    AbsList = [absValue(N) || N <- List],
    [io:format("~p~n", [A]) || A <- AbsList].
