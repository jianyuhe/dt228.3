%rule 1
minsavings(M_S) :- dependents(D),
				   M_S is 5000 * D.
minicome(M_I) :- dependents(D),
				 M_I is 15000 + (4000 * D).
earnings(E) :- earning(E2),
				E is E2.
account_saved(A_S) :- saved(S),	
					A_S is S.
bigger(E,M_I) :- E >= M_I,
				 write('Adequate income.'),
				 assert(in_come(i_adequate))
				 ;
				 E < M_I,
				 write('Inadequate income.'),
				 assert(in_come(i_inadequate)).
bigger2(A_S,M_S) :- A_S >= M_S,
					write('Adequate Savings account.'),
					assert(savings(s_adequate))
					;
					A_S < M_S,
					write('Inadequate Savings account.'),
					assert(savings(s_inadequate)).
income(adequate) :- in_come(i_adequate).
income(inadequate) :- in_come(i_inadequate).
savings_account(adequate) :- account_sacved(A_S),
							 minsavings(M_S),
							 A_S > M_S.
savings_account(inadequate) :- savings(s_inadequate).

savings_account(ad
%rule 2
investment(stocks) :- savings_account(adequate),
					  income(adequate).
%rule 3
investment(combination) :- savings_account(adequate),
						   income(inadequate).
%rule 1
investment(saving) :- savings_account(inadequate).

go :-
	getEarnings,
	getAccount_saved,
	getDependents,
	(
	minicome(M_I),nl,
	write('minincome is '), write(M_I),
	earnings(E), nl,
	write('income is '), write(E),
	minsavings(M_S),nl,
	write('minsavings is '), write(M_S),
	account_saved(A_S), nl,
	write('account_saved is '), write(A_S),
	nl,bigger(E,M_I), nl,bigger2(A_S,M_S), nl,
	investment(I), write('Investment advise is : '), write(I)
	),cleanInputs.

getEarnings :-
	write('Input the income '),
	read(E2),
	nl, write('Steady or Unsteady :')
	read().
	assert(earning(E2)).
getAccount_saved :-
	write('Input the Account_saved'),
	read(S),
	assert(saved(S)).
getDependents :-
	write('Input the dependents'),
	read(D),
	assert(dependents(D)).
cleanInputs :-
	retractall(earning(_)),
	retractall(saved(_)),
	retractall(dependents(_)),
	retractall(in_come(_)),
	retractall(savings(_)).
