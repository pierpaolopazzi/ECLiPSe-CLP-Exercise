:- lib(fd).


torta(Nonna, Cane, Torta, StartNonna, StartCane, StartTorta):-
	S=[Nonna, Cane, Torta],
	S::1..3,
	StartNonna is 0,
	StartCane::0..5,
	StartTorta::0..5,
	
	alldifferent(S),
	
	element(Nonna, [5,3,2], DurataNonna),
	element(Cane, [4,2,3], DurataCane),
	element(Torta, [2,5,4], DurataTorta),
	
	StartCane #> StartNonna,
	StartCane #< StartNonna+DurataNonna, 
	
	StartTorta #>= StartNonna, 
	StartTorta #>= StartCane, 
	
	StartTorta + DurataTorta #<= StartNonna+DurataNonna,
	StartTorta + DurataTorta #<= StartCane+DurataCane,
	
	L=[Nonna, Cane, Torta, StartNonna, StartCane, StartTorta],
	labeling(L). 
