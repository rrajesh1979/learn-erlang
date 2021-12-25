-module(map_reduce).
-export([standardize_measures_to_cm/1]).

standardize_measures_to_cm(Measures) ->
    F = fun
        ({cm, _} = Measure) -> Measure;
        ({m, Value}) -> {cm, round(Value * 100)}
    end,
    lists:map(F, Measures).