:- module(test, []).
:- use_module(prolog/dcg_extras).

:- begin_tests(dcg_extras).

:- set_prolog_flag(double_quotes, chars).

test(...) :-
    Phrase = "Hello, you all!",
    phrase((...,"you",...,"!"), Phrase),
    phrase((...,"Hello",...), Phrase),
    phrase((...,"all!"), Phrase),
    not(phrase((...,"youz",...), Phrase)).

:- end_tests(dcg_extras).
