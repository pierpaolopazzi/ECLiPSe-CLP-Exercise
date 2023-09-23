calciatore(1..N):- ncalciatori(N).

{caratt(IdCalc,IdCaratt):caratteristica(IdCaratt,_,_)}=3:- calciatore(IdCalc).

caratt_assegnata(IdCalc,IdCaratt):- caratt(IdCalc,IdCaratt), caratteristica(IdCaratt,_,_), calciatore(IdCalc).  

:- se(Id,Caratt1,Caratt2), caratt_assegnata(Id,Caratt1), not caratt_assegnata(Id,Caratt2).
 

:- #sum{1,IdCaratt,IdCalc:caratt(IdCalc,IdCaratt)}=S,caratteristica(IdCaratt,_,N), S!=N.


#show caratt/2.
