
  %Student name: Yuwei Chen
  %Student number: D16123951
 

opp(e,w).
opp(w,e).

unsafe(F,X,X,C) :- opp(F,X).
unsafe(F,W,X,X) :- opp(F,X).

% move(State1, State2).

goal(state(e,e,e,e)).

% move the wolf
move(state(X,X,G,C), state(Y,Y,G,C)) :-
    opp(X,Y),
    not(unsafe(Y,Y,G,C)).


% move the goat
move(state(X,W,X,C), state(Y,W,Y,C)) :-
    opp(X,Y),
    not(unsafe(Y,W,Y,C)).


% move the cabbage
move(state(X,W,G,X), state(Y,W,G,Y)) :- opp(X,Y), not(unsafe(Y,W,G,Y)).

% move self only
move(state(X,W,G,C), state(Y,W,G,C)) :- opp(X,Y), not(unsafe(Y,W,G,C)).


% Pretty printing code for FWGC solution path and states.
% showPath(Path)
showPath([]) :- nl.

showPath([S|Path]) :-
    nl,showState(S),
    showPath(Path).


showState(S) :-
    showWest(S), write('|~~~~~~~|'), showEast(S),nl,
    write('    |~~~~~~~|').

showWest(state(F,W,G,C)) :-
    (F == w, write('F'), !; write(' ')),
    (W == w, write('W'), !; write(' ')),
    (G == w, write('G'), !; write(' ')),
    (C == w, write('C'), !; write(' ')).

showEast(state(F,W,G,C)) :-
    (F == e, write('F'), !; true),
    (W == e, write('W'), !; true),
    (G == e, write('G'), !; true),
    (C == e, write('C'), !; true).


% solve the path to move from e -> w solve(state(X), _), _ for "true"
solve(S, Soln) :-
  solve(S, [], Sol),
  reverse(Sol, Soln),
  showPath(Soln).

solve(X, P, [X | P]) :- goal(X).

solve(X, P, Sol) :-
  move(X, Y),
  not(member(Y, P)),
  solve(Y, [X | P], Sol).


go :-
  solve(state(w,w,w,w), _).
