-module(mystring).
-export([return/0]).

return() -> 
    %% 文字は $a で文字aを定義できる 
    %% 文字（文字列）は内部で整数型 or 整数型のリストの糖衣構文である
    String = $a, 

    %% なので,下の実行結果は 97 (ASCIIコード) が出力される
    io:format("~p~n", [String]),

    FirstName = "Taro", 
    LastName = "Yamada", 
    %% 文字列の結合は ++ 演算子である
    FullName = LastName ++ " " ++ FirstName, 
    io:format("~s~n", [FullName]), 

    Str = [$a, $b, $c],
    case Str =:= "abc" of
        true ->
            io:format("~p~n", [Str]);
        false ->
            io:format("~p does not equal to abc~n", [Str])
    end. 

