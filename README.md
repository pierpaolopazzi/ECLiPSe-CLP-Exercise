# ECLiPSe-CLP-Exercise
Some ECLiPSe exercises

CLP(FD): Constrained Logic Programming (Finite Domain)

Used for modelling and resolving constrained problems

Problem Model:
- Variables: problem entities
- Finite Domains: variables are defined by finite domains (usually Integer)
- Constraints: variables relations

In optimization problems we add an Objective Function.

How to resolve?
- propagation algorithm 
- Search strategy

CLP Machine: Foundamental Steps

- Resolution r
	- Atom (ground) selection from resolvent
	- Unification: add constraints to the constraint store
- Constraining c
	- Constrain selection from resolvent
	- add constraint to the constraint store
- Infer (propagation) i
	- Constraint store transformation
- Consistency s
	- check the satisfiability of the constraint store

The following exercises are from my University period. You can find simple exercises and more complex. 
