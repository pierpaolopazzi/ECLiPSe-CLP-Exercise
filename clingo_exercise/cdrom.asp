
file(1,120).
file(2,100).
file(3,150).
file(4,400).
file(5,260).
file(6,120).
file(7,180).
file(8,500).
file(9,90).
file(10,80).

{salvare(ID,Dim)}:- file(ID, Dim).

:- overflow. 
overflow :- #sum{Dim,ID:salvare(ID,Dim)}>600.

#maximize{Dim,ID:salvare(ID,Dim)}.

#show salvare/2.
