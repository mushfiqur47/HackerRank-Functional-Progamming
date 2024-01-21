%https://www.hackerrank.com/challenges/fp-sum-of-odd-elements/problem





-module(solution).
-export([main/0]).

read(Su) ->
    case io:fread("", "~d") of
        eof -> io:format("~p~n",[Su]);
        {ok, [N]} -> if (N rem 2=/=0)-> read(Su+N);
                         (N rem 2 =:=0)-> read(Su)
            end
    end.

main() ->
    read(0).

