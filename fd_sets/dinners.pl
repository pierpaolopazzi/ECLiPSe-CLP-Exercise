%% A woman wants to invite N friends at dinner:
%% For N(N-1)/6 days, she wants to organize some dinner,
%% where each dinner has exactly 3 friends and the same 2 friends
%% dont meet together at two or more dinners.
%% In Other words, each day has 3 guests, and the intersection 
%% of guests of 2 different days it must be at most 1 person. 

:- lib(fd).
:- lib(fd_sets).


program(N, SetsList):-
	Ndays#=N*(N-1)/6,
	intsets(SetsList, Ndays, 0, N),
	setConstr(SetsList),
	setLabeling(SetsList).
	
setConstr([]).
setConstr([Set|S1]):-
	#(Set,3),
	intersMax1(Set,S1),
	setConstr(S1).
	
intersMax1(_,[]).
intersMax1(S1,[S2|Sets]):-
	fd_sets:(intersection(S1,S2,S3)),
	fd:(X::[0,1]),
	#(S3,X),
	intersMax1(S1,Sets).
	
setLabeling([]).
setLabeling([S|Sets]):-
	insetdomain(S,_,_,_),
	setLabeling(Sets).
