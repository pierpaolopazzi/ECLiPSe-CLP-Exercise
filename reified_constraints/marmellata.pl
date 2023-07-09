:- lib(fd).


marmellata(Aldo, Dario, Elio, Bruno, Carlo, Franco):-
	L=[Aldo, Dario, Elio, Bruno, Carlo, Franco],
	L::0..1,
	
	Frasi=[A,D,E,B,C],
	Frasi::0..1,
	
	A #<=> Dario+Elio#=1,
	B #<=> Carlo+Franco#=1,
	C #<=> Franco+Elio#=1,
	D #<=> Aldo+Elio#=1,
	E #<=> Carlo+Bruno#=1,
	
	Aldo+Dario+Elio+Bruno+Carlo+Franco#=2,
	A+B+C+D+E#=4,
	labeling(L).
	
