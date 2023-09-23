:- lib(fd).
:- lib(fd_global).
:- lib(listut).
:- [impegni].

giugno(L):-
	length(L,30),
	L::1..4,
	findall([Genitore,Giorno], impegno(Genitore,Giorno), Limpegni),
	impegni_constraint(L, Limpegni),
	genitori_constraint(L),
	fd_global:atmost(7,L,3),
	asilo_constraint(L,1,PrimoGiornoAsilo, UltimoGiornoAsilo, IscrittoAsilo),
	UltimoGiornoAsilo-PrimoGiornoAsilo #=< 7,
	IscrittoAsilo::0..1,
	PrimoGiornoAsilo::1..30,
	UltimoGiornoAsilo::1..30,
	occurrences(4, L, Tata),
	Costo#=100*IscrittoAsilo+50*Tata,
	min_max(labeling(L), Costo).
%%	labeling(L).
	


impegni_constraint(_,[]).	
impegni_constraint(L, [[Genitore,Giorno]|Limpegni]):-	
	nth1(Giorno, L, X),
	X#\=Genitore,
	impegni_constraint(L, Limpegni).
	
genitori_constraint(_).
genitori_constraint(L):-
	occurrences(1,L,GiorniPadre),
	GiorniPadre::0..4,
	occurrences(2,L,GiorniMadre),
	GiorniMadre::0..6.
	
asilo_constraint([],_,_,_,_).
asilo_constraint([H|T], GiornoN, PrimoGiornoAsilo, UltimoGiornoAsilo, IscrittoAsilo):-
	H #= 3 #<=> VaAsiloGiornoN #/\ IscrittoAsilo,
	PrimoGiornoAsilo #=< GiornoN #<=> InizioAsiloPrimaDelGiornoN,
	UltimoGiornoAsilo #>= GiornoN #<=> TerminaAsiloDopoGiornoN,
	VaAsiloGiornoN #=< InizioAsiloPrimaDelGiornoN,
	VaAsiloGiornoN #=< TerminaAsiloDopoGiornoN,
	GiornoN1 is GiornoN+1,
	asilo_constraint(T,GiornoN1,PrimoGiornoAsilo,UltimoGiornoAsilo,IscrittoAsilo).
	
	
	
	
	
	
