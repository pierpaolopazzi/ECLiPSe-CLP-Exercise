% color(X,red) :- nodo(X), not color(X,green), not color(X, yellow).
% color(X,green) :- nodo(X), not color(X,red), not color(X, yellow).
% color(X,yellow) :- nodo(X), not color(X,green), not color(X, red).


{color(X,Y)}:- nodo(X),palette(Y).
:- nodo(X), not colorato(X).
colorato(X):- color(X,Y).
:- color(A,B),color(C,B),near(A,C).
:- color(N,C), color(N,C1), C!=C1.

near(1,2).
near(1,3).
near(2,3).
near(2,4).
near(2,5).
near(3,4).

nodo(1).
nodo(2).
nodo(3).
nodo(4).
nodo(5).

palette(red).
palette(green).
palette(yellow).

#show color/2.
