-module(myfunc).
-export([for/3]).

%% 関数自体の定義は問題ないと思う
%% キーワード when を使うことで,ガードを実現できる
%% ガードはパターンマッチングだけでは表現できない追加の条件をつけたせる
%% 例えば、func(number) の引数 number が0以上など...
for(End, End, Skip) when End =/= Skip -> 
    io:format("~B~n", [End]);
for(Start, End, Skip) when Start =:= Skip -> 
    for(Start + 1, End, Skip);
for(Start, End, Skip) -> 
    io:format("~B~n", [Start]), 
    for(Start + 1, End, Skip).
