invitato(1..N):- num_invitati(N).
tavolo(1..T):- num_tavoli(T).



1{siede(T,I):tavolo(T)}1:- invitato(I). 

:- siede(T,I1), siede(T,I2), conflitto(I1,I2), tavolo(T).

:- #count{I:siede(T,I)}>C, tavolo(T), capacita(C).

amici(S) :- #count{I1:siede(T,I1), siede(T,I2), conosce(I1,I2)}=S.

#maximize{S:amici(S)}.

#show siede/2. 
