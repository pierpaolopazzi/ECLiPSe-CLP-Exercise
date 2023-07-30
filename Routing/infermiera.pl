:- lib(ic).
:- lib(branch_and_bound).
:- lib(propia).
:- [pazienti].


infermiera(PathL):-
	
	% - Extract my data
 
	findall(ID, paziente(ID,_,_), PazList),
	length(PazList, NumeroPaz),
	Nplace is NumeroPaz+1,

 	% - Create the Path
 
 	length(PathL,Nplace),
	domain(PathL, NumeroPaz),
 
	alldifferent(PathL),

 	% - Apply the distance and Time window constraints
  
	applyDistaConstr(PathL,Dist,0),	
	minimize(labeling(PathL),Dist).
	
	
domain([],_).
domain([HPathL|TPathL], NumeroPaz):-
	HPathL=0,
	TPathL::1..NumeroPaz.

applyDistaConstr([Last], Dist, CostIter):-
	distanza(Last,0,Cost) infers ac,
	Dist #= CostIter + Cost.
applyDistaConstr([ThisPat, NextPat|Lpat], Dist, CostIter):-
	distanza(ThisPat, NextPat, Cost) infers ac,
	paziente(NextPat, MinTime, MaxTime) infers ac,
	CostSucc #= Cost + CostIter,
	CostSucc #>= MinTime,
	CostSucc #=< MaxTime,
	applyDistaConstr([NextPat|Lpat], Dist, CostSucc).

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
