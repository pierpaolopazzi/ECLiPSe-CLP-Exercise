:- lib(fd).

csp([Dario, Umberto, Gedeone]):-
	Dario::1..100,
	Umberto::1..100,
	Gedeone::1..100,
	Dario+11#=Gedeone-X,
	Gedeone-X#=6*(Dario-X),
	Umberto#=Dario+3,
	Umberto#=Gedeone-Dario-3,
	labeling([Dario, Umberto, Gedeone]).
	
