:- [automobili].
:- lib(fd).
:- lib(edge_finder).

optional(LStartCerchi, LStartAria, LStartSat):-
	
	% - Creo i miei Data
	
	findall(rich(Num, Consegna, CerchiLega, AriaCondizionata, Satellitare), rich(Num, Consegna, CerchiLega, AriaCondizionata, Satellitare), Data),
	
	% - Inizializzo la mie StartList
	
	makeStartList(Data, TotEnd, LStartCerchi, LStartAria, LStartSat, LEnd),
	
	% - Estraggo la lista delle durate e delle risorse, ovvero quli macchine vogliono cosa
	
	extractDurList(Data, LDurCerchi, LDurAria, LDurSat),
	extractRisList(Data, LRisC, LRisA, LRisSat),
	
	% - Impongo la cumulative perché la macchina può montare solo un optional alla volta
	
	cumulative(LStartCerchi, LDurCerchi, LRisC, 1),
	cumulative(LStartAria, LDurAria, LRisA, 1),
	cumulative(LStartSat, LDurSat, LRisSat, 1),
	
	% - Faccio append per avere il labeling finale
	
	append(LStartCerchi, LStartAria, Res1),
	append(Res1, LStartSat, Res2),
	
	% - min_max per il risultato ottimale
	
	min_max(labeling(Res2), TotEnd).
	
	

makeStartList([],_,[],[],[],[]).
makeStartList([rich(_, Dur, Cer, Aria, Sat)|T], TotEnd, [StartC|Tc], [StartA|Ta], [StartS|Ts], [End|TEnd]):-
	StartC #>= 0,
	StartA #>= 0,
	StartS #>= 0,
	
	DurC is 20*Cer,
	DurA is 80*Aria,
	DurS is 50*Sat,
	
	StartC + DurC #=< End,
	StartA + DurA #=< End,
	StartS + DurS #=< End,
	
	End #=< Dur,
	End #=< TotEnd, 
	cumulative([StartC, StartA, StartS], [DurC, DurA, DurS], [Cer, Aria, Sat], 1),
	makeStartList(T, TotEnd, Tc, Ta, Ts, TEnd).

extractDurList([],[],[],[]).
extractDurList([rich(_,_,Cer,Aria,Sat)|T], [DurC|Tc], [DurA|Ta], [DurS|Ts]):-
	DurC is 20*Cer,
	DurA is 80*Aria, 
	DurS is 50*Sat,
	extractDurList(T,Tc,Ta,Ts).

extractRisList([],[],[],[]).
extractRisList([rich(_,_,Cer,Aria,Sat)|T],[Cer|Tc],[Aria|Ta],[Sat|Ts]):-
	extractRisList(T, Tc, Ta, Ts).
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
