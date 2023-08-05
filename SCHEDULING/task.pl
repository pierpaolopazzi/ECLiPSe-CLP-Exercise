:- lib(fd).
:- lib(edge_finder).


task(j1,3,[],m1).
task(j2,8,[],m1).
task(j3,8,[j4,j5],m1).
task(j4,6,[],m2).
task(j5,3,[j1],m2).
task(j6,4,[j1],m2).

csp(LStart, LEnd):-
	findall(task(NAME, DURATION, ListOfPrecedingTask, Machine), task(NAME, DURATION, ListOfPrecedingTask, Machine), Data),
	makeTaskVariables(Data, End, TaskList),
	precedence(TaskList),
	machines(TaskList),
	extract_start(TaskList,LStart),
	extract_end(LStart,TaskList,LEnd),
	min_max(labeling(LStart), End).
	
	
makeTaskVariables([],_,[]).
makeTaskVariables([task(N,D,P,M)|T], End, [task(N,D,P,M,Start)|V]):-
	Start #>= 0, Start #=< End-D,
	makeTaskVariables(T,End,V).

precedence([]).	
precedence(TaskList):- precedence2(TaskList, TaskList).

precedence2([],_).
precedence2([task(_,_,Prec,_,Start)|T], TaskList):-
	impose_after(Prec,Start,TaskList),
	precedence2(T,TaskList).

impose_after([],_,_).
impose_after([PrecJ|LPrec], StartI, TaskList):- !,
	get_task(PrecJ, TaskList, task(PrecJ, DJ,_,_,StartJ)),
	StartI #>= StartJ + DJ,
	impose_after(LPrec,StartI,TaskList).

	
get_task(J, [task(J, DJ, PJ, MJ, StartJ)|_], task(J,DJ,PJ,MJ,StartJ)):-!.
get_task(J, [_|TaskList], TaskJ):-
	get_task(J, TaskList,TaskJ).
	
	
machines(TaskList):-
	findall(M, task(_,_,_,M),LM),
	remove_duplicates(LM,ListMachines),
	impose_cumulative(ListMachines,TaskList).
	
remove_duplicates([],[]).
remove_duplicates([HM|TM], ListMachines):- member(HM,TM),!, remove_duplicates(TM, ListMachines).
remove_duplicates([HM|TM], [HM|ListMachines]):- remove_duplicates(TM, ListMachines).

impose_cumulative([],_).
impose_cumulative([M|LM], TaskList):-
	select_same_machine(M, TaskList, LStart,LDur),
	disjunctive(LStart,LDur),
	impose_cumulative(LM, TaskList).

select_same_machine(_,[],[],[]).	
select_same_machine(M, [task(_,D,_,M,Start)|T], [Start|LStart], [D|LDur]):-
	select_same_machine(M, T, LStart, LDur).
select_same_machine(M, [_|TaskList], LStart,LDur):- select_same_machine(M,TaskList,LStart,LDur).
	
extract_start([],[]).
extract_start([task(_,_,_,_,Start)|L], [Start|Lstart]):-
	extract_start(L, Lstart).
	
extract_end([],[],[]).
extract_end([Start|LStart],[task(_,D,_,_,Start)|TaskList],[End|LEnd]):-
	End #= Start + D,
	extract_end(LStart,TaskList,LEnd).













