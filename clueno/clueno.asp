giocatore(0..4).
arma(1..6).
assassino(1..6).

{armaGiocatore(A,G):giocatore(G)}=1:- arma(A).
{assassinoGiocatore(Ass,G):giocatore(G)}=1:- assassino(Ass).

{armaGiocatore(A,0):giocatore(0),arma(A)}=1.
{assassinoGiocatore(Ass,0):giocatore(0),assassino(Ass)}=1.

:- risposta(Req,Ris,Ass,Arma), Ris!=0,  not armaGiocatore(Arma,Ris), not assassinoGiocatore(Ass,Ris).

:- risposta(Req,0,Ass,Arma), not assassinoGiocatore(Ass,0),not assassinoGiocatore(Ass,Req).
:- risposta(Req,0,_,Arma), not armaGiocatore(Arma,0), not armaGiocatore(Arma, Req).

#show armaGiocatore/2.
#show assassinoGiocatore/2.

