% Di 6 bambini si sa che esattamente 2 hanno rubato la marmellata. Ma chi?
% Aldo dice "Dario ed Elio"
% Bruno dice "Carlo e Franco"
% Carlo dice "Franco ed Elio"
% Dario dice "Aldo ed Elio"
% Elio dice "Carlo e Bruno"
%
% Franco è assente.
% Uno dei 5 bambini ha nominato due innocenti. Gli altri hanno nominato un innocente ed un colpevole.
% Si scirva un programma CLP che scopre chi ha rubato la marmellata.


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
	
