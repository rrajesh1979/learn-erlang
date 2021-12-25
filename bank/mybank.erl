-module(mybank).

-export([start/0, stop/0]).
-export([main_loop/0]).

start() ->
    io:format("~n~nWelcome to my bank~n~n"),
    Pid = spawn(?MODULE, main_loop, []),
    register(mybank, Pid).

stop() ->
    mybank ! terminate.

main_loop() ->
    receive
        terminate ->
            io:format("~n~nClosing bank~n~n")
    end.