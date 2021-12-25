-module(mybank).

-export([start/0]).
-export([main_loop/0]).

start() ->
    io:format("~n~nWelcome to my bank~n~n"),
    spawn(?MODULE, main_loop, []).

main_loop() ->
    receive
        terminate ->
            io:format("~n~nClosing bank~n~n")
    end.