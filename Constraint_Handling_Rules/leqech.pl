:- lib(ech).
:- handler less_or_equal.
:- constraints leq/2.

reflexivity ::= leq(X,X) <=> true.
antisimmetry ::= leq(X,Y), leq(Y,X) <=> X=Y.
transitivity ::= leq(X,Y), leq(Y,Z) ==> leq(X,Z).
