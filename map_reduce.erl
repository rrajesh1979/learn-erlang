-module(map_reduce).
-export([standardize_measures_to_cm/1, total_cm/1]).

standardize_measures_to_cm(Measures) ->
    F = fun
        ({cm, _} = Measure) -> Measure;
        ({m, Value}) -> {cm, round(Value * 100)}
    end,
    lists:map(F, Measures).

total_cm(Measures) ->
    StandardizedMeasures = standardize_measures_to_cm(Measures),
    F = fun({cm, Value}, Acc) -> 
        Acc + Value
    end,
    lists:foldl(F, 0, StandardizedMeasures).