% Which statements are true?
% 1- The answer to #6 and #7 are the same.
% 2- #1 is false.
% 3- The answer to #4 and #20 are different.
% 4- The answer to #3 and #20 are different.
% 5- The answer to this statement is different from the answe to #19
% 6- #2 is true.
% 7- #15 is true.
% 8- The answer to  #11 and #19 are the same.
% 9- #10 is true.
% 10- #13 is false.
% 11- Mrs. Jones is allergic to strawberries.
% 12- #16 is true.
% 13- #12 is true.
% 14- The answer to this statements is the same as the answer to #11.
% 15- At least half the statements in this problem are false.
% 16- At least half the statements in this problem are true.
% 17- The answer to #9 and #4 are the same.
% 18- #7 is true.
% 19- Mrs. Jones first name is Shirley.
% 20- The answer to #3 and #4 are different.

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
