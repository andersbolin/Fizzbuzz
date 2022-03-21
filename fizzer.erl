-module(fizzer).

-include_lib("stdlib/include/assert.hrl").

-export([fizzbuzz/1,tester/0]).

-spec fizzbuzz(Number::integer()) -> string().
fizzbuzz(Number) ->

    Result = case (Number rem 3) of
                 0 -> "fizz";
                 _ -> []
             end
             ++
             case (Number rem 5) of
                 0 -> "buzz";
                 _ -> [] 
             end,
    case Result of
        []        -> integer_to_list(Number);
        _FizzBuzz -> Result
    end.  

tester() -> 

    ExpectedResult = ["1","2","fizz","4","buzz","fizz","7","8","fizz","buzz","11","fizz","13","14",
                      "fizzbuzz","16","17","fizz","19","buzz","fizz","22","23","fizz","buzz","26",
                      "fizz","28","29","fizzbuzz","31","32","fizz","34","buzz","fizz","37","38",
                      "fizz","buzz","41","fizz","43","44","fizzbuzz","46","47","fizz","49","buzz",
                      "fizz","52","53","fizz","buzz","56","fizz","58","59","fizzbuzz","61","62",
                      "fizz","64","buzz","fizz","67","68","fizz","buzz","71","fizz","73","74",
                      "fizzbuzz","76","77","fizz","79","buzz","fizz","82","83","fizz","buzz","86",
                      "fizz","88","89","fizzbuzz","91","92","fizz","94","buzz","fizz","97","98",
                      "fizz","buzz"],

	Result = lists:map(fun fizzbuzz/1, lists:seq(1, 100)),
    ?assertMatch(Result,ExpectedResult),
	io:format("~p",[Result]).
