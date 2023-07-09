:- lib(fd).


statements(S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13,S14,S15,S16,S17,S18,S19,S20):-
	[S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13,S14,S15,S16,S17,S18,S19,S20]::0..1,
	L=[S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13,S14,S15,S16,S17,S18,S19,S20],
	
	S1 #<=> (S6#=1 #/\ S7#=1) #\/ (#\+S6 #/\ #\+S7),
	S2 #<=> #\+S1,
	S3 #<=> S4#\=S20,
	S4 #<=> S3#\=S20,
	S5 #<=> #\+S19,
	S6 #<=> S2,
	S7 #<=> S15,
	S8 #<=> (S11#=1 #/\ S19#=1) #\/ (#\+S11 #/\ #\+S19),
	S9 #<=> S10,
	S10 #<=> #\+S13,
	S12 #<=> S16,
	S13 #<=> S12,
	S14 #<=> S11,
	S15 #<=> S1+S2+S3+S4+S5+S6+S7+S8+S9+S10+S11+S12+S13+S14+S15+S16+S17+S18+S19+S20#=<10,
	S16 #<=> S1+S2+S3+S4+S5+S6+S7+S8+S9+S10+S11+S12+S13+S14+S15+S16+S17+S18+S19+S20#>=10,
	S17 #<=> (S9 #/\ S4) #\/ (#\+S9 #/\ #\+S4),
	S18 #<=> S7,
	S20 #<=> S3#\=S4,
	labeling(L).