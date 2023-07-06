% Gedeone, talking with his friend about his nephews, answers about their age as follow:
% In 11 years, Dario will have my age of when he (Dario) was 6 times yunger than me (Gedeone). 
% Umberto, has 3 years more than Dario, and minus 3 years than the difference between me (Gedeone) and Dario.

:- lib(fd).

csp([Dario, Umberto, Gedeone]):-
	Dario::1..100,
	Umberto::1..100,
	Gedeone::1..100,
	Dario+11#=Gedeone-X,
	Gedeone-X#=6*(Dario-X),
	Umberto#=Dario+3,
	Umberto#=Gedeone-Dario-3,
	labeling([Dario, Umberto, Gedeone]).
	
