:- lib(fd).
:- lib(fd_global).
:- lib(matrix_util).
:- lib(listut).

% Lamborghini 1
% Ferrari 2
% Alfa Romeo 3
% Maserati 4

% Carrozzeria
% Giallo 1
% Rosso 2
% Nero 3
% Grigio 4
% Altro 5

% Interni
% Marrone 1
% Panna 2
% Blu 3
% Verde 4
% Altro 5


telefonata(1,1,2,1).
telefonata(2,2,3,1).
telefonata(3,3,1,2).
telefonata(1,2,4,3).
telefonata(3,4,3,3).

salone(Matrice):-	
	findall(M, telefonata(M,_,_,_), Lmacchine),
	findall(Colore, telefonata(_,Colore,_,_), Lcarrozzerie),
	findall(Costo, telefonata(_,_,Costo,_), Lcosti),
	findall(Interni, telefonata(_,_,_,Interni), Linterni),
	
	matrix(4,3,Matrice),
	flatten(Matrice,L),
	creaDom(Matrice, [5,4,5]),
	
	prezziDiversi(Matrice),
	interniVerdi(Matrice),
	bugie(Matrice, Lmacchine, Lcarrozzerie,Lcosti,Linterni, BugieTot),
	
	minimize(labeling(L), BugieTotali).
	
	
bugie(_,[],[],[],[],0).
bugie(Matrice, [Hm|Tm], [Hc|Tc], [Hp|Tp], [Hi|Ti], BugieTotali):-
	nth1(Hm, Matrice, Riga),
	bugieMacchina(Riga, Hc,Hp,Hi,BugieDette),
	bugie(Matrice, Tm,Tc,Tp,Ti,BugieRicorsive),
	BugieTotali#=BugieDette+BugieRicorsive.


bugieMacchina([Carrozzeria,Costo,Interni], Ca,Co,I,BugieDette):-
	Carrozzeria #\= Ca #<=> BugiaCa,
	Costo #\= Co #<=> BugiaCo,
	Interni #\= I #<=> BugiaI,
	BugieDette #= BugiaCa+BugiaCo+BugiaI.
	

	
interniVerdi(Matrice):-
	estraiInfo(Matrice,3,Interni),
	vincoloVerde(Interni, VerdiTotali),
	VerdiTotali #> 0.
	
vincoloVerde([],0).
vincoloVerde([H|T], VerdiTotali):-
	H #= 4 #<=> Verde,
	vincoloVerde(T, VerdiTotali1),
	VerdiTotali#=Verde+VerdiTotali1.


prezziDiversi(Matrice):-
	estraiInfo(Matrice,2,Costi),
	fd_global:alldifferent(Costi).
	
estraiInfo([],_,[]).
estraiInfo([Riga|T], I, [Costo|Lcosti]):-
	nth1(I, Riga, Cost),
	estraiInfo(T,I,Lcosti).
	

	
creaDom([],_).
creaDom([Riga|T], ListaDomini):-
	domRiga(Riga,ListaDomini),
	creaDom(T,ListaDomini).
	
domRiga([],[]).
domRiga([Hel|Riga], [Hd|Td]):-
	Hel::1..Hd,
	domRiga(Riga,Td).
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
