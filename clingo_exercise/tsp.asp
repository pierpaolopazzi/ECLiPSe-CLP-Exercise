edge(X,Y) :- cost(X,Y,C).

{cycle(X,Y):edge(X,Y)}=1 :- node(X).
{cycle(X,Y):edge(X,Y)}=1 :- node(Y).

reached(Y) :- cycle(1,Y).
reached(Y) :- cycle(X,Y), reached(X).

:- node(Y), not reached(Y).

#minimize{C,X,Y:cycle(X,Y), cost(X,Y,C)}.

#show cycle/2.
