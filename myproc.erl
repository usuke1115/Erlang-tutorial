-module(myproc).
-export([room_process/1, client/0, start/0]).

%% Pid ! Msg でプロセスIDが Pid　であるプロセスに対し, Msg というメッセージを送ることができる
%% 下の関数はしれっと無名関数を使っている
%% 無名関数の構文: fun(X) -> process end, List
room_process(PidList) -> 
    lists:foreach(fun(Pid) -> Pid ! {ok, "Hello Client"} end, PidList).

%% receive でメッセージを受信することができる
client() -> 
    receive
        {ok, X} -> io:format("recived message: ~p~n", [X]) 
    end.

%% spawnはプロセスを生成する関数である
%% spawn(module name, function name, [arguments])
start() -> 
    Pid1 = spawn(myproc, client, []), 
    Pid2 = spawn(myproc, client, []), 
    PidList = [Pid1, Pid2], 
    spawn(myproc, room_process, [PidList]).
