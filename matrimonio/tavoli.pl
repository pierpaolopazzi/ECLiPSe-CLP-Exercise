:- lib(fd).
:- lib(fd_global).
:- lib(listut).
:- [matrimonio].

tavoli(L):-
	num_invitati(NI),
	num_tavoli(NT),
	capacita(C),
	findall([X,Y], conflitto(X,Y), Lconflitti),
	findall([X,Y], conosce(X,Y), Lconoscenti),
	length(LT,NT),
	lista_tavoli(LT,1),
	
	% La lista L è composta dai venti invitati ognuno dei quali 
	% puo sedersi in uno degli NT tavoli
	
	length(L, NI),
	L::1..NT,
	
	% - Aggiungo il vincolo di capacita dei tavoli

	capacity_constraint(L,LT,C),

	% - Elimino dai valori di L quelli che sono in confitto
	
	conflitto_constraint(L, Lconflitti),
	
	conoscenti_constraint(L, Lconoscenti, Nconoscenti),

	% - vogliamo massimizzare il numero di conoscenti
	
	MinConoscenti #= Nconoscenti*(-1),
	minimize((labeling(L),myprint_list(L)),MinConoscenti).
	
myprint_list([]):-nl.
myprint_list([H|L]):-
	write(H),write(','),myprint_list(L).
	
lista_tavoli([],_).
lista_tavoli([Tavolo|LT], Tavolo):-
	TavoloSucc is Tavolo+1,
	lista_tavoli(LT, TavoloSucc). 


capacity_constraint(_,[],_).
capacity_constraint(L,[Tavolo|LT],C):- 
	fd_global:atmost(C,L,Tavolo),
	capacity_constraint(L, LT, C).
	
	
conflitto_constraint(_,[]).
conflitto_constraint(L, [[P1,P2]|Lconflitti]):-
	nth1(P1, L, T1),
	nth1(P2, L, T2),
	T1#\=T2,
	conflitto_constraint(L, Lconflitti).
	
conoscenti_constraint(_,[],0).
conoscenti_constraint(L, [[I,J]|Lconoscenti], Nconoscenti):-
	nth1(I, L, Tavolo1),
	nth1(J, L, Tavolo2),
	Tavolo1#=Tavolo2 #<=> Conoscenti,
	Nconoscenti#=Nconoscenti2+Conoscenti,	
	conoscenti_constraint(L,Lconoscenti,Nconoscenti2).

	


