cross(w, e).
cross(e, w).

execmove([F, W, G, C], 0, [NF, NW, NG, NC]) :- F = W,
                                               cross(F, NF),
                                               cross(W, NW),
                                               NG = G,
                                               NC = C.
execmove([F, W, G, C], 1, [NF, NW, NG, NC]) :- F = G,
                                               cross(F, NF),
                                               NW = W,
                                               cross(G, NG),
                                               NC = C.
execmove([F, W, G, C], 2, [NF, NW, NG, NC]) :- F = C,
                                               cross(F, NF),
                                               NW = W,
                                               NG = G,
                                               cross(C, NC).
execmove([F, W, G, C], 3, [NF, NW, NG, NC]) :- cross(F, NF),
                                               NW = W,
                                               NG = G,
                                               NC = C.


answer([e,e,e,e], []).
answer(State, [Move|Moves]) :- execmove(State, Move, [F, W, G, C]),
                               (W \= G; G = F),
                               (G \= C; C = F),
                               answer([F, W, G, C], Moves).
                               
anshelp(S, L, X) :- length(X, L), answer(S, X);
                 L2 is L + 1, anshelp(S, L2, X).
                 
getans(S, X) :- anshelp(S, 0, X).
printans([]).
printans([0|T]) :- write('The farmer takes the wolf across.\n'), printans(T).
printans([1|T]) :- write('The farmer takes the goat across.\n'), printans(T).
printans([2|T]) :- write('The farmer takes the cabbage across.\n'), printans(T).
printans([3|T]) :- write('The farmer crosses alone.\n'), printans(T).

-- getans([w,w,w,w], X), printans(X)