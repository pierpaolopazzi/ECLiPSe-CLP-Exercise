edge(A,B) :- edge(B,A).

{clique(N)}:- node(N).

:- clique(A), clique(B), not edge(A,B), A!=B.

#maximize{1,X:clique(X)}.

#show clique/1.
