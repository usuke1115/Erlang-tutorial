-module(myList).
-export([start/0, show/1]).

start() ->
    %% [ 式 || パターン　 <- リスト, 条件 ] がErlangのリスト内方表記
    %% 条件は X < 4 などで指定できるが, これは指定しなくても動く
    List = [ X * 2 || X<-lists:seq(1, 10) ],
    A = calcLen(List, 0),
    io:format("~p~n", [A]), 
    show(List).

show([]) -> 
    ok;
show([H | Rest]) -> 
    io:format("~B~n", [H]),
    show(Rest).

calcLen([], Length) -> 
    Length;
calcLen([_ | Rest], Length) -> 
    calcLen(Rest, 1 + Length).
