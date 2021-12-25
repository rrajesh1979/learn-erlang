-module(guards).
-export([demo/1]).
-export([is_domestic/1]).
-define(DOMESTIC_ANIMALS, [cat, dog, bird, guinea_pig, horse, donkey, ferret]).

demo(X) when is_integer(X); is_float(X) ->
    number;
demo(X) when is_list(X), length(X) == 0 ->
    empty_list;
demo(X) when is_list(X), length(X) =< 3 ->
    short_list;
demo(X) when is_list(X), length(X) > 3 ->
    long_list.

%% is_domestic(X)
is_domestic(Animal) -> 
    lists:member(Animal, ?DOMESTIC_ANIMALS).
