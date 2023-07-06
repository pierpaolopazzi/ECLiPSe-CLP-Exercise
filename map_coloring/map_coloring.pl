:- lib(fd).

map_coloring([V1,V2,V3,V4,V5]):-
	V1::[red,green,yellow, blue],
	V2::[red,green,yellow, blue],
	V3::[red,green,yellow, blue],
	V4::[red,green,yellow, blue],
	V5::[red,green,yellow, blue],
	V1#\=V2, V1#\=V3, V1#\=V4, V1#\=V5,
	V2#\=V3, V2#\=V4, V3#\=V5,
	V3#\=V4, V4#\=V5,
	labeling([V1,V2,V3,V4,V5]).
