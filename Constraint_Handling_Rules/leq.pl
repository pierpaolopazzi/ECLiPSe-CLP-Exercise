
%%% The following code has been produced by the CHR compiler


:- ( current_module(chr) -> true ; use_module(library(chr)) ).

:- get_flag(variable_names, Val), setval(variable_names_flag, Val), set_flag(variable_names, off).
leq(A, B) :-
	'CHRgen_num'(C),
	coca(add_one_constraint(C, leq(A, B))),
	'CHRleq_2'(leq(A, B), D, E, C).



%%% Rules handling for leq / 2

'CHRleq_2'(leq(A, B), C, D, E) :-
	(
	    'CHRnonvar'(C)
	;
	    'CHRalready_in'('CHRleq_2'(leq(A, B), C, D, E)),
	    coca(already_in)
	),
	!.
'CHRleq_2'(leq(A, A), B, C, D) ?-
	coca(try_rule(D, leq(A, A), reflexivity, leq(E, E), replacement, true, true)),
	!,
	'CHRkill'(B),
	coca(fired_rule(reflexivity)).
'CHRleq_2'(leq(A, B), C, D, E) ?-
	'CHRget_delayed_goals'(A, F),
	'CHRleq_2__1'(F, [A, B], [], G),
	coca(try_double(E, leq(A, B), G, leq(B, A), leq(H, I), leq(I, H), replacement, true, H = I, antisimmetry)),
	!,
	'CHRkill'(C),
	coca(fired_rule(antisimmetry)),
	A = B.
'CHRleq_2'(leq(A, B), C, D, E) ?-
	'CHRget_delayed_goals'(A, F),
	'CHRleq_2__2'(F, [A, B], [], G),
	coca(try_double(E, leq(A, B), G, leq(B, A), leq(H, I), leq(I, H), replacement, true, I = H, antisimmetry)),
	!,
	'CHRkill'(C),
	coca(fired_rule(antisimmetry)),
	B = A.
'CHRleq_2'(leq(A, B), C, D, E) :-
	'CHRleq_2__0'(leq(A, B), C, D, E).
'CHRleq_2__1'(['CHRleq_2'(leq(A, B), C, D, E)|F], [B, A], [], G) ?-
	'CHRvar'(C),
	'CHRkill'(C),
	'CHR='([], []),
	'CHR='(E, G).
'CHRleq_2__1'([A|B], C, D, E) :-
	'CHRleq_2__1'(B, C, D, E).
:- set_flag('CHRleq_2__1' / 4, leash, notrace).
'CHRleq_2__2'(['CHRleq_2'(leq(A, B), C, D, E)|F], [B, A], [], G) ?-
	'CHRvar'(C),
	'CHRkill'(C),
	'CHR='([], []),
	'CHR='(E, G).
'CHRleq_2__2'([A|B], C, D, E) :-
	'CHRleq_2__2'(B, C, D, E).
:- set_flag('CHRleq_2__2' / 4, leash, notrace).
:- set_flag('CHRleq_2' / 4, leash, notrace).
:- current_macro('CHRleq_2' / 4, _25113, _25114, _25115) -> true ; define_macro('CHRleq_2' / 4, tr_chr / 2, [write]).
'CHRleq_2__0'(A, B, C, D) :-
	'CHRleq_2__3'(A, B, C, D).
:- set_flag('CHRleq_2__0' / 4, leash, notrace).
'CHRleq_2__3'(leq(A, B), C, D, E) ?-
	'CHRvar'(C),
	!,
	'CHRget_delayed_goals'(B, F),
	'CHRleq_2__3__4'(F, C, leq(A, B), D, E).
'CHRleq_2__3'(leq(A, B), C, D, E) :-
	'CHRleq_2__3__5'(leq(A, B), C, D, E).
:- set_flag('CHRleq_2__3' / 4, leash, notrace).
'CHRleq_2__3__4'(['CHRleq_2'(leq(A, B), C, D, E)|F], G, leq(H, A), I, J) ?-
	'CHRvar'(C),
	'CHRcheck_and_mark_applied'('12'(transitivity), G, C, I, D),
	coca(try_double(J, leq(H, A), E, leq(A, B), leq(K, L), leq(L, M), augmentation, true, leq(K, M), transitivity)),
	!,
	coca(fired_rule(transitivity)),
	'CHRleq_2__3__4'(F, G, leq(H, A), I, J),
	leq(H, B).
'CHRleq_2__3__4'([A|B], C, D, E, F) :-
	'CHRleq_2__3__4'(B, C, D, E, F).
'CHRleq_2__3__4'([], A, B, C, D) :-
	'CHRleq_2__3__5'(B, A, C, D).
:- set_flag('CHRleq_2__3__4' / 5, leash, notrace).
'CHRleq_2__3__5'(leq(A, B), C, D, E) ?-
	'CHRvar'(C),
	!,
	'CHRget_delayed_goals'(A, F),
	'CHRleq_2__3__5__6'(F, C, leq(A, B), D, E).
'CHRleq_2__3__5'(leq(A, B), C, D, E) :-
	'CHRleq_2__3__5__7'(leq(A, B), C, D, E).
:- set_flag('CHRleq_2__3__5' / 4, leash, notrace).
'CHRleq_2__3__5__6'(['CHRleq_2'(leq(A, B), C, D, E)|F], G, leq(B, H), I, J) ?-
	'CHRvar'(C),
	'CHRcheck_and_mark_applied'('21'(transitivity), G, C, I, D),
	coca(try_double(J, leq(B, H), E, leq(A, B), leq(K, L), leq(M, K), augmentation, true, leq(M, L), transitivity)),
	!,
	coca(fired_rule(transitivity)),
	'CHRleq_2__3__5__6'(F, G, leq(B, H), I, J),
	leq(A, H).
'CHRleq_2__3__5__6'([A|B], C, D, E, F) :-
	'CHRleq_2__3__5__6'(B, C, D, E, F).
'CHRleq_2__3__5__6'([], A, B, C, D) :-
	'CHRleq_2__3__5__7'(B, A, C, D).
:- set_flag('CHRleq_2__3__5__6' / 5, leash, notrace).
'CHRleq_2__3__5__7'(leq(A, B), C, D, E) :-
	(
	    'CHRvar'(C)
	->
	    'CHRdelay'([C, leq(A, B)], 'CHRleq_2'(leq(A, B), C, D, E))
	;
	    true
	).
:- set_flag('CHRleq_2__3__5__7' / 4, leash, notrace).

:- getval(variable_names_flag, Val), set_flag(variable_names, Val).
