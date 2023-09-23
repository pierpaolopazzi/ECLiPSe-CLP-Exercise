auto(1..4).
prezzo(1..4).

colore(gialla).
colore(rossa).
colore(nera).
colore(grigia).

interni(blu).
interni(verdi).
interni(marroni).
interni(panna).

telefonata(1,3,gialla,marroni,3).
telefonata(2,1,rossa,marroni,1).
telefonata(3,2,nera,panna,4).
telefonata(4,3,rossa,blu,1).
telefonata(5,2,grigia,blu,2).


{autoColore(Id,Colore):colore(Colore)}=1:-auto(Id).
{autoInterni(Id,Interno):interni(Interno)}=1:-auto(Id).
{autoPrezzo(Id,Prezzo):prezzo(Prezzo)}=1:-auto(Id).


interno_verde(Id):-autoInterni(Id,verdi), colore(verdi).

:- #count{1,Id:autoInterni(Id,verdi)}!=1.

#minimize{1,Id,Colore:autoColore(Id,Colore), telefonata(_,Id,Colore2,_,_),Colore!=Colore2; 
	1,Id,Interni:autoInterni(Id,Interni), telefonata(_,Id,_,Interni2,_),Interni!=Interni2; 
	1,Id,Prezzo:autoPrezzo(Id,Prezzo), telefonata(_,Id,_,_,Prezzo2), Prezzo!=Prezzo2}. 



#show autoColore/2.
#show autoInterni/2.
#show autoPrezzo/2.
