
%%% The following code has been produced by the CHR compiler


:- ( current_module(chr) -> true ; use_module(library(chr)) ).

:- get_flag(variable_names, Val), setval(variable_names_flag, Val), set_flag(variable_names, off).
neg(A, B) :-
	'CHRgen_num'(C),
	coca(add_one_constraint(C, neg(A, B))),
	'CHRneg_2'(neg(A, B), D, E, C).



%%% Rules handling for neg / 2

'CHRneg_2'(neg(A, B), C, D, E) :-
	(
	    'CHRnonvar'(C)
	;
	    'CHRalready_in'('CHRneg_2'(neg(A, B), C, D, E)),
	    coca(already_in)
	),
	!.
'CHRneg_2'(neg(1, A), B, C, D) ?-
	coca(try_rule(D, neg(1, A), anonymous("0"), neg(1, E), replacement, true, E = 0)),
	!,
	'CHRkill'(B),
	coca(fired_rule(anonymous("0"))),
	A = 0.
'CHRneg_2'(neg(0, A), B, C, D) ?-
	coca(try_rule(D, neg(0, A), anonymous("1"), neg(0, E), replacement, true, E = 1)),
	!,
	'CHRkill'(B),
	coca(fired_rule(anonymous("1"))),
	A = 1.
'CHRneg_2'(neg(A, 1), B, C, D) ?-
	coca(try_rule(D, neg(A, 1), anonymous("2"), neg(E, 1), replacement, true, E = 0)),
	!,
	'CHRkill'(B),
	coca(fired_rule(anonymous("2"))),
	A = 0.
'CHRneg_2'(neg(A, 0), B, C, D) ?-
	coca(try_rule(D, neg(A, 0), anonymous("3"), neg(E, 0), replacement, true, E = 1)),
	!,
	'CHRkill'(B),
	coca(fired_rule(anonymous("3"))),
	A = 1.
'CHRneg_2'(neg(A, A), B, C, D) ?-
	coca(try_rule(D, neg(A, A), anonymous("4"), neg(E, E), replacement, true, false)),
	!,
	'CHRkill'(B),
	coca(fired_rule(anonymous("4"))),
	false.
'CHRneg_2'(neg(A, B), C, D, E) :-
	'CHRneg_2__20'(neg(A, B), C, D, E).
:- set_flag('CHRneg_2' / 4, leash, notrace).
:- current_macro('CHRneg_2' / 4, _3857, _3858, _3859) -> true ; define_macro('CHRneg_2' / 4, tr_chr / 2, [write]).
'CHRneg_2__20'(neg(A, B), C, D, E) ?-
	'CHRvar'(C),
	'CHRcheck_and_mark_applied'('CHRneg_2__20', D),
	coca(try_rule(E, neg(A, B), anonymous("5"), neg(F, G), augmentation, true, neg(G, F))),
	!,
	'CHRneg_2__20__22'(neg(A, B), C, D, E),
	coca(fired_rule(anonymous("5"))),
	neg(B, A).
'CHRneg_2__20'(A, B, C, D) ?-
	'CHRneg_2__20__22'(A, B, C, D).
:- set_flag('CHRneg_2__20' / 4, leash, notrace).
'CHRneg_2__20__22'(A, B, C, D) :-
	'CHRneg_2__21'(A, B, C, D).
:- set_flag('CHRneg_2__20__22' / 4, leash, notrace).
'CHRneg_2__21'(neg(A, B), C, D, E) :-
	(
	    'CHRvar'(C)
	->
	    'CHRdelay'([C, neg(A, B)], 'CHRneg_2'(neg(A, B), C, D, E))
	;
	    true
	).
:- set_flag('CHRneg_2__21' / 4, leash, notrace).
and(A, B, C) :-
	'CHRgen_num'(D),
	coca(add_one_constraint(D, and(A, B, C))),
	'CHRand_3'(and(A, B, C), E, F, D).



%%% Rules handling for and / 3

'CHRand_3'(and(A, B, C), D, E, F) :-
	(
	    'CHRnonvar'(D)
	;
	    'CHRalready_in'('CHRand_3'(and(A, B, C), D, E, F)),
	    coca(already_in)
	),
	!.
'CHRand_3'(and(A, A, B), C, D, E) ?-
	coca(try_rule(E, and(A, A, B), anonymous("6"), and(F, F, G), replacement, true, G = F)),
	!,
	'CHRkill'(C),
	coca(fired_rule(anonymous("6"))),
	B = A.
'CHRand_3'(and(A, 0, B), C, D, E) ?-
	coca(try_rule(E, and(A, 0, B), anonymous("7"), and(F, 0, G), replacement, true, G = 0)),
	!,
	'CHRkill'(C),
	coca(fired_rule(anonymous("7"))),
	B = 0.
'CHRand_3'(and(0, A, B), C, D, E) ?-
	coca(try_rule(E, and(0, A, B), anonymous("8"), and(0, F, G), replacement, true, G = 0)),
	!,
	'CHRkill'(C),
	coca(fired_rule(anonymous("8"))),
	B = 0.
'CHRand_3'(and(A, B, 1), C, D, E) ?-
	coca(try_rule(E, and(A, B, 1), anonymous("9"), and(F, G, 1), replacement, true, (F = 1, G = 1))),
	!,
	'CHRkill'(C),
	coca(fired_rule(anonymous("9"))),
	[A, B] = [1, 1].
'CHRand_3'(and(A, 1, 0), B, C, D) ?-
	coca(try_rule(D, and(A, 1, 0), anonymous("10"), and(E, 1, 0), replacement, true, E = 0)),
	!,
	'CHRkill'(B),
	coca(fired_rule(anonymous("10"))),
	A = 0.
'CHRand_3'(and(1, A, 0), B, C, D) ?-
	coca(try_rule(D, and(1, A, 0), anonymous("11"), and(1, E, 0), replacement, true, E = 0)),
	!,
	'CHRkill'(B),
	coca(fired_rule(anonymous("11"))),
	A = 0.
'CHRand_3'(and(A, B, C), D, E, F) :-
	'CHRand_3__23'(and(A, B, C), D, E, F).
:- set_flag('CHRand_3' / 4, leash, notrace).
:- current_macro('CHRand_3' / 4, _5521, _5522, _5523) -> true ; define_macro('CHRand_3' / 4, tr_chr / 2, [write]).
'CHRand_3__23'(and(A, B, C), D, E, F) ?-
	'CHRvar'(D),
	'CHRcheck_and_mark_applied'('CHRand_3__23', E),
	coca(try_rule(F, and(A, B, C), anonymous("12"), and(G, H, I), augmentation, true, and(H, G, I))),
	!,
	'CHRand_3__23__25'(and(A, B, C), D, E, F),
	coca(fired_rule(anonymous("12"))),
	and(B, A, C).
'CHRand_3__23'(A, B, C, D) ?-
	'CHRand_3__23__25'(A, B, C, D).
:- set_flag('CHRand_3__23' / 4, leash, notrace).
'CHRand_3__23__25'(A, B, C, D) :-
	'CHRand_3__24'(A, B, C, D).
:- set_flag('CHRand_3__23__25' / 4, leash, notrace).
'CHRand_3__24'(and(A, B, C), D, E, F) :-
	(
	    'CHRvar'(D)
	->
	    'CHRdelay'([D, and(A, B, C)], 'CHRand_3'(and(A, B, C), D, E, F))
	;
	    true
	).
:- set_flag('CHRand_3__24' / 4, leash, notrace).
or(A, B, C) :-
	'CHRgen_num'(D),
	coca(add_one_constraint(D, or(A, B, C))),
	'CHRor_3'(or(A, B, C), E, F, D).



%%% Rules handling for or / 3

'CHRor_3'(or(A, B, C), D, E, F) :-
	(
	    'CHRnonvar'(D)
	;
	    'CHRalready_in'('CHRor_3'(or(A, B, C), D, E, F)),
	    coca(already_in)
	),
	!.
'CHRor_3'(or(A, A, B), C, D, E) ?-
	coca(try_rule(E, or(A, A, B), anonymous("13"), or(F, F, G), replacement, true, G = F)),
	!,
	'CHRkill'(C),
	coca(fired_rule(anonymous("13"))),
	B = A.
'CHRor_3'(or(A, 0, B), C, D, E) ?-
	coca(try_rule(E, or(A, 0, B), anonymous("14"), or(F, 0, G), replacement, true, G = F)),
	!,
	'CHRkill'(C),
	coca(fired_rule(anonymous("14"))),
	B = A.
'CHRor_3'(or(0, A, B), C, D, E) ?-
	coca(try_rule(E, or(0, A, B), anonymous("15"), or(0, F, G), replacement, true, G = F)),
	!,
	'CHRkill'(C),
	coca(fired_rule(anonymous("15"))),
	B = A.
'CHRor_3'(or(A, B, 0), C, D, E) ?-
	coca(try_rule(E, or(A, B, 0), anonymous("16"), or(F, G, 0), replacement, true, (F = 0, G = 0))),
	!,
	'CHRkill'(C),
	coca(fired_rule(anonymous("16"))),
	[A, B] = [0, 0].
'CHRor_3'(or(A, 0, 1), B, C, D) ?-
	coca(try_rule(D, or(A, 0, 1), anonymous("17"), or(E, 0, 1), replacement, true, E = 1)),
	!,
	'CHRkill'(B),
	coca(fired_rule(anonymous("17"))),
	A = 1.
'CHRor_3'(or(0, A, 1), B, C, D) ?-
	coca(try_rule(D, or(0, A, 1), anonymous("18"), or(0, E, 1), replacement, true, E = 1)),
	!,
	'CHRkill'(B),
	coca(fired_rule(anonymous("18"))),
	A = 1.
'CHRor_3'(or(A, B, C), D, E, F) :-
	'CHRor_3__26'(or(A, B, C), D, E, F).
:- set_flag('CHRor_3' / 4, leash, notrace).
:- current_macro('CHRor_3' / 4, _7197, _7198, _7199) -> true ; define_macro('CHRor_3' / 4, tr_chr / 2, [write]).
'CHRor_3__26'(or(A, B, C), D, E, F) ?-
	'CHRvar'(D),
	'CHRcheck_and_mark_applied'('CHRor_3__26', E),
	coca(try_rule(F, or(A, B, C), anonymous("19"), or(G, H, I), augmentation, true, or(H, G, I))),
	!,
	'CHRor_3__26__28'(or(A, B, C), D, E, F),
	coca(fired_rule(anonymous("19"))),
	or(B, A, C).
'CHRor_3__26'(A, B, C, D) ?-
	'CHRor_3__26__28'(A, B, C, D).
:- set_flag('CHRor_3__26' / 4, leash, notrace).
'CHRor_3__26__28'(A, B, C, D) :-
	'CHRor_3__27'(A, B, C, D).
:- set_flag('CHRor_3__26__28' / 4, leash, notrace).
'CHRor_3__27'(or(A, B, C), D, E, F) :-
	(
	    'CHRvar'(D)
	->
	    'CHRdelay'([D, or(A, B, C)], 'CHRor_3'(or(A, B, C), D, E, F))
	;
	    true
	).
:- set_flag('CHRor_3__27' / 4, leash, notrace).

:- getval(variable_names_flag, Val), set_flag(variable_names, Val).
