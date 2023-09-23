auto(1..4).

colore(giallo).
colore(rosso).
colore(nero).
colore(grigio).

interni(marroni).
interni(verdi).
interni(blu).
interni(panna).
ordPrezzo(1..4).

autof(1,3,giallo,marroni,2).
autof(2,1,rosso,marroni,4).
autof(3,2,nero,panna,1).
autof(4,3,rosso,blu,4).
autof(5,2,grigio,blu,3).

{autoColor(Id,C):colore(C)}=1:-auto(Id).
{autoInterni(Id,I):interni(I)}=1:-auto(Id).

{autoOrdPrezzo(Id,P):ordPrezzo(P)}=1 :- auto(Id).
{autoOrdPrezzo(Id,P): auto(Id)}=1 :- ordPrezzo(P).

verdiConstr :- #sum{1,Id:autoInterni(Id,verdi)}=1.
:- not verdiConstr.

#minimize{1,Id,C1:autoColor(Auto,C1),autof(Id,Auto,C2,_,_),C1!=C2;
	1,Id,C1:autoInterni(Auto,C1),autof(Id,Auto,_,C2,_),C1!=C2;
	1,Id,C1:autoOrdPrezzo(Auto,C1),autof(Id,Auto,_,_,C2),C1!=C2}.
	
#show autoColor/2.
#show autoInterni/2.
#show autoOrdPrezzo/2.
