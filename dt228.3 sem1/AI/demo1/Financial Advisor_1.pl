% Financial Advisor
% code to get started

% declare predicates and their arity
% not necessary, but avoids warnings



income(A) :- 
	earnings(X,steady),
	dependents(Y),
	minincome(Y, MI),
	(X > MI,
    A = adequate;
    X =< MI,
    A = inadequate).
	
savings_account(B) :- 
	amount_saved(X),
	dependents(Y),
	minsavings(Y, MS),
	(X > MS,
    B = adequate;
    X =< MS,
    B = inadequate).

minsavings(D, MS) :- MS is 5000 *D.

minincome(D, MI) :-
	MI is 15000 + D * 4000.
	
income(inadequate) :- earnings(X, unsteady).
	
investment(savings) :- savings_account(inadequate).
	
investment(stock) :- savings_account(adequate), income(adequate).

investment(combination) :- 	savings_account(adequate), income(inadequate).
/*	
savings_account(adequate) :-
   amount_saved(X),
   dependents(Y),
   minsavings(Y,MS),
   greater(Y, MS).
	
savings_account(inadequate) :-
   amount_saved(X),
   dependents(Y),
   minsavings(Y,MS),
   greater(MS, Y).
	
income(adequate) :-
    earnings(X, steady),
	dependents(Y),
	minincome(Y,I),
	greater(X,I).	
	
income(inadequate) :- 
    earnings(X, steady),
	dependents(Y),
	minincome(Y, I),
	greater(I,X).
	*/
go :-
    getDependents,
	getSaving,
	getEarnings,
	(savings_account(SA),income(IN),investment(I),nl,
	write('Savings account is: '),write(SA),nl,
	write('Income is: '),write(IN),nl,
	write('Get : '),nl,
	write('investment: '),write(I);
	write('error')
	),
	cleanInputs.
	

	getDependents :-
	write('input the dependents '),
	read(D),
	assert(dependents(D)).
	
	getEarnings :-
	write('input the earnings '),
	read(E), 
	write('steady or unsteady '),
	read(S),
	assert(earnings(E,S)).
	
	getSaving :-
	write('input the savings '),
	read(GS),
	assert(amount_saved(GS)).
	
	cleanInputs :- 
    retractall(dependents(_)),
    retractall(amount_saved(_)),
    retractall(earnings(_)).
	