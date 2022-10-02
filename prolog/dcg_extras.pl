:- module(dcg_extras, [seq//1, seqq//1, (...)//0]).
/** <module> Extra DCG utilities
 Taken from The Power of Prolog by Markus Triska

 It's recommended to set the flag to write lists of characters as strings:
 ==
 :- set_prolog_flag(double_quotes, chars).
 ==

 @see https://www.metalevel.at/prolog/dcg
 */


%%	seq(-List)// is det.
%%	seq(+List)// is det.
%
% Describes a sequence of elements.
%
%	==
% ?- phrase(("Hello, ",seq(Cs),"!"), "Hello, all!").
%    Cs = "all" ;
%    false.
%	==

seq([])     --> [].
seq([E|Es]) --> [E], seq(Es).

%%	seqq(-List)// is det.
%%	seqq(+List)// is det.
%
% Describes a sequence of sequences.
%
% ==
% ?- phrase(seqq(["ab","cd","ef"]), Ls).
%    Ls = "abcdef".
% ==

seqq([]) --> [].
seqq([Es|Ess]) -->
        seq(Es),
        seqq(Ess).


%%	(...)// is det.
%
% Describes "any sequence at all"
%
% ==
% ?- phrase((...,"you",...,"!"), "Hello, you all!").
%    true ;
%    false.
% ==

... --> [] | [_], ... .
