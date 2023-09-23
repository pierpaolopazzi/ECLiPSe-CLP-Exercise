:- lib(fd).
:- lib(fd_global).
:- lib(listut).
:- [risposte].


clueno(L,Lassassini, Larmi):-
	
	length(Lassassini,6),
	Lassassini::0..4,
	occurrences(0,Lassassini,1),
	length(Larmi,6),
	Larmi::0..4,
	occurrences(0,Larmi,1),
	
	findall(risposta(Req,Res,Ass,Arma),risposta(Req,Res,Ass,Arma),Lrisposte),

	
	risposte_constraint(Lassassini, Larmi, Lrisposte),
	
	append(Lassassini, Larmi, L),

	labeling(L).

risposte_constraint(_,_,[]).
risposte_constraint(Lassassini, Larmi, [risposta(Req,Res,Ass,Arma)|Lrisposte]):-
	nth1(Ass, Lassassini, AssassinoX),
	nth1(Arma, Larmi, ArmaX),
	(Res=0
		-> 
			AssassinoX#=Req #/\ ArmaX#=Req #<=> B1,
			AssassinoX#=0 #/\ ArmaX#=Req #<=> B2,
			AssassinoX#=0 #/\ ArmaX#=0 #<=> B3,
			AssassinoX#=Req	#/\ ArmaX#=0 #<=> B4,
			B1+B2+B3+B4#=1 
		; 
			AssassinoX#=Res #<=> B1,
			ArmaX#=Res #<=> B2,
			B1+B2 #>= 1
	),
	risposte_constraint(Lassassini,Larmi,Lrisposte).
		
	
	
	
