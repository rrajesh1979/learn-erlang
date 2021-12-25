-module(util_functions).
-export([factorial/1]).
-export([reverse_list/1]).
-export([convert_list_to_binary/1]).
-export([starts_with/2]).
-export([starts_with_another/2]).

factorial(0) -> 1;
factorial(N) -> N * factorial(N-1).

reverse_list(List) ->
    reverse_list(List, []).

reverse_list([], Acc) ->
    Acc;
reverse_list([Head|Tail], Acc) ->
    reverse_list(Tail, [Head|Acc]).

convert_list_to_binary(List) ->
    convert_list_to_binary(List, <<>>).

convert_list_to_binary([], Acc) ->
    Acc;

convert_list_to_binary([Head|Tail], Acc) ->
    convert_list_to_binary(Tail, <<Acc/binary, Head>>).

%%starts_with(SubString, String)
starts_with(SubString, String) ->
    case string:left(String, length(SubString)) of 
        SubString -> true;
        _ -> false
    end.
    
starts_with_another(SubString, String) ->
    Left = string:left(String, length(SubString)),
    if 
        Left =:= SubString -> true;
        true -> false
    end.