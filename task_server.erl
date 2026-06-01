-module(task_server).
-export([start/0, add_task/1, loop/0]).

%% register(Name, Pid)
%% register関数を使うと、Pid が Pidであるプロセスに対し、 Name という名前を割り当てることができる
%% こうすることで、 Name を使い、プロセスに対し、メッセージを送ることができる
start() -> 
    Pid = spawn(?MODULE, loop, []), 
    register(task_server, Pid).

%% この関数で task_server を使い、メッセージを送っている
%% ( 本来なら Pid を指定する )
%% 今回はプロセスに task_server という名前をつけているため、これでメッセージを送信できる )
add_task(Task) -> 
    task_server ! {add, Task}.

loop() -> 
    receive
        {add, Task} -> 
            io:format("Task added: ~p~n", [Task]), 
            loop()
    end.
