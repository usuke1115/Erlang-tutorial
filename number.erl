%% % で1行をコメントできるよ!!
%% 習慣的に %% でコメントアウトするみたい
-module(number).
-export([returnNumber/0]).

returnNumber() -> 
    OnePlusTwo = 1 + 2, 
    TwoTimes = OnePlusTwo * 2, 
    DecrementedNum = TwoTimes - 1, 
    %% 整数同士の割り算は num1 div num2
    %% 浮動小数点を扱う（計算結果を浮動小数点にしたい）なら num1 / num2 を使う
    Quotient = DecrementedNum div 5,
    %% Erlangでは余り演算子は rem.
    Remainder = DecrementedNum rem 3, 
    %% io:format関数は標準出力をしてくれる
    %% ~n => 改行
    %% ~B => 10進数整数
    %% ~s => 文字列
    %% ~f => 浮動小数点
    %% ~p => なんでも表示
    %% 上のようなフォーマット指定子がある
    io:format("1 + 2 = ~B.~n", [OnePlusTwo]), 
    io:format("(1 + 2) * 2 = ~B.~n", [TwoTimes]), 
    io:format("~B - 1 = ~B.~n", [TwoTimes, DecrementedNum]),
    io:format("~B / 5 = ~B.~n", [DecrementedNum, Quotient]),
    io:format("~B % 3 = ~B.~n", [DecrementedNum, Remainder]), 

    %% 型チェックありの比較演算子が =:= (JSでいうところの === ), =/= (JSでいうところの !== )
    %% ==, /= は型チェックがないので, 基本使わないと思う
    case 4 / 2 =:= 4 div 2 of
        true -> 
            String = "4 / 2 =:= 4 div 2", 
            io:format("~s~n", [String]);
        false -> 
            String = "4 / 2 =/= 4 div 2", 
            io:format("~s~n", [String])
    end.

