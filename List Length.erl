

-module(solution).
-export([main/0]).

counter(Curr)->
    case io:fread("","~d") of
        eof -> io:format("~p~n",[Curr]);
        {ok,[N]}-> counter(Curr+1)
    end.


main() ->
    counter(0).
