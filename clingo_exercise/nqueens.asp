% - we decide the matrix dimension. In this case is 8

scacchiera(1).
scacchiera(N+1):- scacchiera(N), N<8.


{queen(R,C)}:- scacchiera(R), scacchiera(C).

:- scacchiera(C), not queen(_,C).
:- scacchiera(R), not queen(R,_).

:- queen(R,C), queen(R1,C), R!=R1.
:- queen(R,C), queen(R,C1), C!=C1.

:- queen(R1,C1), queen(R2,C2), R1+C1=R2+C2, R1!=R2, C1!=C2.

:- queen(R1,C1), queen(R2,C2), R1-C1=R2-C2, R1!=R2, C1!=C2.

#show queen/2.
