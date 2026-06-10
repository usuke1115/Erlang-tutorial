-module(fileManipulation).
-export([start/0, cat/1, readLine/1]).

%% file:read_file(Filename)
%% 上の関数を使い、ファイルを open せずともファイルを読み込むことができる
%% すべての行を読み込むことができる関数
start() -> 
    { ok, Data } = file:read_file("index.txt"), 
    io:format("~s", [Data]).


%% file:open(Filename, Mode = open | write | ...)
%% Filename というファイルを Mode というモードで open できる (読み込みモードとか書き込みモード) 
%% 1行ずつファイルを読み込むときや、書き込みを行いたい時に使う
%% 
%% file:close()
%% 上の関数を使うことでファイルを閉じることができる
cat(Filename) -> 
    case file:open(Filename, read) of
        { error, Reason } -> io:format("file open error ~w~n", [Reason]);
        { ok, In } -> readLine(In), file:close(In)
    end.


%% file:read_line(IoDevice)
%% 実際に1行ずつ読み取ったファイルの内容を受け取ることができる
readLine(In) -> 
    case file:read_line(In) of
        eof -> ok;
        { ok, Line } -> 
            io:format("~s", [Line]), 
            readLine(In)
    end.
