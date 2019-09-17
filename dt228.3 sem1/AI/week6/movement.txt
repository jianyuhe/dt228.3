oop(e,w).
oop(w,e).

unsafe(F,X,X,C) :- oop(F,X).
unsafe(F,W,X,X) :- oop(F,X).

move(state(X,X,G,C), state(Y,Y,G,C)) :- oop(X,Y), not(unsafe(Y,Y,G,C)).

move(state(X,W,X,C), state(Y,W,Y,C)) :- oop(X,Y), not(unsafe(Y,W,W,C)).