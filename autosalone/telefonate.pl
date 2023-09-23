:- lib(fd).
:- lib(fd_global).
:- lib(listut).

nauto(4).
auto(1,ferrari).
auto(2,alfaromeo).
auto(3,lamborghini).
auto(4,maserati).

% - telefonata(Id_telefonata, Id_auto, Col_carrozzeria, Col_interni, Coso).
ntelefonate(5).
telefonata(1,3,1,2,3).
telefonata(2,1,2,2,1).
telefonata(3,2,3,3,4).
telefonata(4,3,2,4,1).
telefonata(5,2,4,4,2).

prezzo(1,1,ferrari,rossa,marroni).
prezzo(1,4,lamborghini,rossa,blu).
prezzo(2,2,alfaromeo,grigia,blu).
prezzo(3,3,lamborghini,gialla,marroni).
prezzo(4,2,alfaromeo,nera,panna).

interni(1,verdi).
interni(2,marroni).
interni(3,panna).
interni(4,blu).
interni(5,altro).

% - macchina(Id_colore, Colore, N_macchine_con_interno_Colore).

macchina(1,verdi,1).

carrozzeria(1,gialla).
carrozzeria(2,rossa).
carrozzeria(3,nera).
carrozzeria(4,grigia).
carrozzeria(5,altro).



autosalone(L):-
	
	findall([IdAuto, NomeAuto], auto(IdAuto,NomeAuto), Lauto),
	findall(interni(Id,Colore), interni(Id,Colore), Linterni),
	length(Linterni, Ninterni),
	findall(carr(Id,Colore), carrozzeria(Id,Colore), Lcarrozzerie),
	length(Lcarrozzerie, Ncolori),
	findall(tel(Idcall,Idcar,Colore,Interni,Prezzo), telefonata(Idcall, Idcar,Colore,Interni,Prezzo), Lcall), 
	nauto(Nauto),
	ntelefonate(Ncall),
	
	length(L, Nauto),
	
	make_list(L, Nauto, Ninterni, Ncolori, 1),
	
	verdi_constraint(L),
	
	extract_list(L, Lcolori, LcolInterni, Lprezzi),
	fd_global:alldifferent(Lprezzi),

	errori_constr(Lcall, Lcolori, LcolInterni, Lprezzi, TotErrori),		

	append(Lcolori,LcolInterni,L1),
	append(L1,Lprezzi,Llabel),
	minimize(labeling(Llabel), TotErrori).
	
	

	
%%%%%%%%%%%%%%%%%%%%%%%%%%%
	
errori_constr([],_,_,_,0):-!.
errori_constr([tel(_,Id,Col,Int,Prezzo)|Lcall], Lcolori,Linterni,Lprezzi,TotErrori):-
	
	nth1(Id, Lcolori, ColoreId),
	nth1(Id, Linterni, InternoId),
	nth1(Id, Lprezzi, PrezzoId),
	
	ColoreId#\= Col #<=> B1,
	InternoId#\= Int #<=> B2,
	PrezzoId #\= Prezzo #<=> B3,
	
	errori_constr(Lcall, Lcolori, Linterni, Lprezzi, TotErrori2),
	TotErrori#=B1+B2+B3+TotErrori2.
	
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%
	
extract_list([],[],[],[]).
extract_list([call(Id_auto, Colore,Interno,Prezzo)|L], [Colore|Lc], [Interno|Li], [Prezzo|Lp]):-
	extract_list(L, Lc, Li, Lp).

%%%%%%%%%%%%%%%%%%%%%%%%%%%	
	
verdi_constraint(L):-
	conta_verdi(L, TotVerdi),
	TotVerdi#=1.
	
conta_verdi([],0):-!.
conta_verdi([call(_,_,Interno,_)|L], TotVerdi):-
	Interno#=1 #<=> Verde,
	conta_verdi(L, TotVerdi2),
	TotVerdi#=Verde+TotVerdi2.
	
%%%%%%%%%%%%%%%%%%%%%%%%%%
	
make_list([],_,_,_,_).
make_list([call(Id_auto, Colore, Interno, Prezzo)|L], Nauto, Ninterni, Ncolori, Auto):-
	Id_auto#=Auto,
	Colore::1..Ncolori,
	Interno::1..Ninterni,
	Prezzo::1..Nauto,
	Auto2 is Auto+1,
	make_list(L, Nauto, Ninterni, Ncolori, Auto2).	
	 





