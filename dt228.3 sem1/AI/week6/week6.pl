

sumList([], 0).
sumList([H|T], R) :-
     sumList(T,RL),
        R is H+RL.

minlist([MIN], MIN).
minlist([F,H|T], M) :- F >= H , minlist([H|T], M).
minlist([F,H|T], M) :- H > F, minlist([F|T], M).

doublelist([],[]).
doublelist([H|T],[HL|TL]) :- doublelist(T, TL), HL is H * 2.

remove_odd([],[]).
remove_odd([El|T], NT):- 
    El mod 2 =\= 0,
    remove_odd(T, NT).
remove_odd([H|T1], [H|T2]):-         
    H mod 2 =:= 0,                     
    remove_odd(T1, T2).
       