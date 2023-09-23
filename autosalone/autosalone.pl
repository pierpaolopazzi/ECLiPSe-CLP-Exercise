:- lib(fd).
:- lib(fd_global).
:- lib(listut).



% - Lamborghini=1
% - Ferrari=2
% - Alfa-Romeo=3
% - Maserati=4

% - Fatti: auto(id,colore,interni,prezzo)

auto(1,gialla,marroni,3).
auto(2,rossa,marroni,1).
auto(3,nera,panna,4).
auto(1,rossa,blu,1).
auto(3,grigia,blu,2).



autosalone(AutoL, InterniL, LL):-
	
	length(AutoL,4),
	NameList=[lamborghini,ferrari,alfaromeo,maserati],
	setNamelist(AutoL,1,NameList),
	extract_list(AutoL,ColoriL,InterniL,PrezzoL),
	PrezzoL::1..4,
	fd_global:alldifferent(PrezzoL),
	ColoriL::[gialla,rossa,nera,grigia],
	InterniL::[marroni,panna,blu,verdi],
	verdi_constr(InterniL,S),
	S#=1,
	findall(auto(Id,Colore,Interno,Prezzo),auto(Id,Colore,Interno,Prezzo),Data),
	check_data(Data, ColoriL, InterniL, PrezzoL, Errors),
	append(ColoriL,InterniL,L),
	append(L,PrezzoL,LL),
	minimize(labeling(LL), Errors).
	
	
	
	
check_data([],_,_,_,0).
check_data([auto(X,Colore,Interni,Prezzo)|DataL], ColoriL, InterniL, PrezzoL, Errors):-
	nth1(X,ColoriL,ColoreX),
	nth1(X,InterniL,InternoX),
	nth1(X,PrezzoL,PrezzoX),
	
	ColoreX#\=Colore #<=> B1,
	InternoX#\=Interni #<=> B2,
	PrezzoX#\=Prezzo #<=> B3,
	check_data(DataL,ColoriL,InterniL,PrezzoL,ErrorIter),
	Errors#=B1+B2+B3+ErrorIter.


extract_list([],[],[],[]).
extract_list([auto(_,_,Colore,Interni,Prezzo)|AutoL],[Colore|ColoriL],[Interni|InterniL],[Prezzo|PrezzoL]):-
	extract_list(AutoL,ColoriL,InterniL,PrezzoL).
	
setNamelist([],_,[]).	
setNamelist([auto(Id,Name,_,_,_)|AutoL],Index, [Name|NameList]):-
	Id#=Index,
	Index1 is Index+1,
	setNamelist(AutoL,Index1,NameList).
		
verdi_constr([],0).
verdi_constr([Interni|InterniL],S):-
	Interni#=verdi #<=> B1,
	verdi_constr(InterniL,S1),
	S#=B1+S1.
