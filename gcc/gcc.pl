% This simple problem show how to use the predicate gcc. 
% We have 7 people and they must be assigned to 5 working shifts.
% So, domains stand for:
% 1: Morning; 2: Day; 3: Night; 4: Backup; 5: day-off
% eg. gcc(1,2,1) stands for: 
% the Morning shifts (third argument) can be occupied by a lower bound (1) to an upper bound (2) of people


:- lib(fd).
:- lib(fd_global_gac).

turni(L):-
	L=[Peter, Paul, Mary, John, Bob, Mike, Julia],
	[Peter, Paul, Mary, John]::1..2,
	Bob::2..3,
	Mike::[2,4,5],
	Julia::[3,5],
	gcc([gcc(1,2,1),gcc(1,2,2),gcc(1,1,3),gcc(0,2,4),gcc(0,2,5)],L).
