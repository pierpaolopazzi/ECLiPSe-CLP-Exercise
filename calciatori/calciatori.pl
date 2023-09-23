:- lib(fd).
:- lib(fd_global).
:- lib(listut).
:- lib(matrix_util).
:- [caratteristiche].

calciatori(L):-
	

	findall(Id, calciatore(Id,_), Lcalciatori),
	findall(caratt(Id,Ngioc), caratteristica(Id,_,Ngioc), Lcaratteristiche),
	findall(se(Id,Caratt1,Caratt2), se(Id,Caratt1,Caratt2), Lse),
	
	length(Lcaratteristiche, Ncaratt),
	length(Lcalciatori, Ncalc),
	length(L, Ncalc),
	
	make_list(L, Lcalciatori, Ncaratt),
	se_constraint(L, Lse),
	extract_caratteristiche(L, Lcaratt),	
	giocatori_constr(Lcaratt, Lcaratteristiche),

	flatten(Lcaratt, Lcarattfl),
	labeling(Lcarattfl).
	
	
extract_caratteristiche([],[]).
extract_caratteristiche([calciatore(_,Caratteristiche)|L], [Caratteristiche|Lcaratt]):-extract_caratteristiche(L, Lcaratt).
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%

giocatori_constr(_,[]).
giocatori_constr(Lcaratt, [caratt(Id, Ngioc)|Lcaratteristiche]):-
	caratt_constr(Lcaratt, Id, SumCaratt),
	SumCaratt#=Ngioc,
	giocatori_constr(Lcaratt, Lcaratteristiche).
	
caratt_constr([],_,0):-!.
caratt_constr([ListaCarattGiocatore|Lcaratt], Id, SumCaratt):-
	nth1(Id, ListaCarattGiocatore, Val),
	caratt_constr(Lcaratt, Id, SumCaratt1),
	SumCaratt#= Val+SumCaratt1.
	
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%
	
se_constraint([],_).
se_constraint([calciatore(Id,Caratteristiche)|L], Lse):-		
	recupero_caratteristiche_calciatore(Id, Lse, Lseid),
	fd_global:sumlist(Caratteristiche,3),
	impongo_vincoli_se(Caratteristiche, Lseid),
	se_constraint(L, Lse).
	
impongo_vincoli_se(_,[]).
impongo_vincoli_se(Caratteristiche, [[_,Caratt1,Caratt2]|Lseid]):-
	nth1(Caratt1, Caratteristiche, Caratt1Var),
	nth1(Caratt2, Caratteristiche, Caratt2Var),
	Caratt2Var#>=Caratt1Var,
	impongo_vincoli_se(Caratteristiche,Lseid).	

recupero_caratteristiche_calciatore(_,[],[]):-!.
recupero_caratteristiche_calciatore(Id, [se(Id,Caratt1,Caratt2)|Lse], [[Id, Caratt1, Caratt2]|Lseid]):- !,
	recupero_caratteristiche_calciatore(Id, Lse, Lseid).
recupero_caratteristiche_calciatore(Id, [_|Lse], Lseid):- recupero_caratteristiche_calciatore(Id, Lse, Lseid).

	
%%%%%%%%%%%%%%%%%%%%%%%%%

make_list([],[],_).
make_list([calciatore(Id, Caratteristiche)|L], [Id|Lcalc], Ncaratt):-
	length(Caratteristiche, Ncaratt),
	Caratteristiche::0..1,
	make_list(L, Lcalc, Ncaratt).




	
