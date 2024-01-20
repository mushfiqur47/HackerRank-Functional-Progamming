
-module(solution).
-export([main/0]).

read(T)->
    case io:fread("","~d") of
        {ok,[H]} -> read([H|T]);
        _ ->
            T
        end.

output(L,S) ->
    if S=:=0->
            ok;
        S>-1 ->
        [H|T] = L,
        io:format("~p~n",[H]),
        output(T,S-1)
    end.

main() ->
    Li = read([]),
    S=length(Li),
    output(Li,S).
