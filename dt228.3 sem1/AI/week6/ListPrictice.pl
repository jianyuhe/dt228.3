append([],L,L).
append([H|T],L2,[H|L3]) :- append(T,L2,L3).

sumList([],0).
sumList([H|T],S) :-
	sumList(T,S1),
	S is H+S1.
	
max([H|T], M) :- max(T, H, M). 

max([], M, M). 
max([H|T], Y, M) :- H =< Y, max(T, Y, M). 
max([H|T], Y, M) :- H > Y, max(T, H, M). 

min([],X,X).
min([H|T],M,X) :- H =< M, min(T,H,X).
min([H|T],M,X) :- M < H, min(T,M,X).
min([H|T],X) :- min(T,H,X).