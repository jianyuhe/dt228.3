% fibonacci
% fib(Number, Y-ray)

fib(0,0).
fib(1,1).
fib(2,1).
fib(N, Y) :-
	N1 is N -1,
	N2 is N -2,
	fib(N1, Y1),
	fib(N2, Y2),
	Y is Y1 + Y2.

