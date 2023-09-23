giorno(1..30).
opzione(1..4).


1{bambino(X,O):opzione(O)}1:-giorno(X).

:- impegno(Genitore,Giorno), bambino(Giorno, Genitore).

:- #count{Giorno:bambino(Giorno,1)}>4.
:- #count{Giorno:bambino(Giorno,2)}>6.

:- bambino(G1,3), bambino(G2, 3), G2-G1>=7.


pagare_asilo :- bambino(G3,3).

costo_tata(C) :- #count{G:bambino(G,4)}=GiorniTata, C=GiorniTata*50.

costo_tot(C) :- costo_tata(C), not pagare_asilo.
costo_tot(Ctot) :- costo_tata(Ctata), pagare_asilo,Ctot=Ctata+100.

#minimize {C:costo_tot(C)}.

#show bambino/2.
