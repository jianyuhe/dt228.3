
%person(name, age, gender, fitness_level).
%person(N, A,G,F).
%drives(name, carType). 
%isImportant(name).
%drinks(name, level)
person(cur, 22, male, excellent).

person(fxs, 33, male, good).
drives(fxs, loc).
drinks(fxs, moderately).
isImportant(susa).

eligible(N) :- person(N, A, G, F),
                  (A>= 18,A =< 32), F = excellent.
				  
eligible(N) :- drives(N, C),person(N, A, G, F), drinks(N, L),
                F = good, L = moderately. 
				
eligible(N) :- isImportant(N).



bicycleLane(dublin, kilkenny, 120).
bicycleLane(dublin, carlow, 80).
bicycleLane(kilkenny, waterford, 85).
bicycleLane(mallow, carlow, 110).
bicycleLane(cork, mallow, 38).
bicycleLane(waterford, youghal, 110).
bicycleLane(youghal, cork, 30).
bicycleLane(dublin, athlone, 105).
bicycleLane(athlone, limerick, 135).
bicycleLane(limerick, cork, 75).
moped(dublin, galway, 200).
moped(galway, limerick, 110).
moped(limerick, ennis, 30).
moped(limerick, cork, 95).

canGoFromTo(A, B) :- bicycleLane(A,B,D1);
					-moped(A,B,D2).
					
canGoFromTo(A, B) :- bicycleLane(A,C,D1),
					bicycleLane(C,B,D2);
					(moped(A,C,D1),moped(C,B,D2)).
					
canGoFromTo(A, B) :- bicycleLane(A,C,D1),
					moped(C,B,D2).
					
canGoFromTo(A, B) :- moped(A,C,D1).
					bicycleLane(C,B,D2).


					


canGoFromTo(A, B, Distance) :- bicycleLane(A,B,D1),
									Distance is D1;
								-moped(A,B,D2),
									Distance is D2.

canGoFromTo(A, B, Distance) : bicycleLane(A,C,D1),
					bicycleLane(C,B,D2),
					Distance is D1+D2;
					(moped(A,C,D1),moped(C,B,D2),Distance is D1+D2).
					

canGoFromTo(A, B, Distance) :  bicycleLane(A,C,D1),
								moped(C,B,D2),
								Distance is D1+D2.

canGoFromTo(A, B, Distance) :- moped(A,C,D1).
					bicycleLane(C,B,D2),
					Distance is D1+D2.
					

				
route(R1,R2).
route(R1,R2,R3).

canGoFromTo(A, B, Distance,route(R1,R2)) :- bicycleLane(A,B,D1),
									Distance is D1,
									R1 is A,
									R2 is B;
								(moped(A,B,D2),
									Distance is D2,
									R1 is A,
									R2 is B).

canGoFromTo(A, B, Distance,route(R1,R2,R3)) : bicycleLane(A,C,D1),
					bicycleLane(C,B,D2),
					Distance is D1+D2,
					R1 is A,
					R2 is C,
					R3 is B;
					(moped(A,C,D1),moped(C,B,D2),Distance is D1+D2,
					R1 is A,
					R2 is C,
					R3 is B).
					

canGoFromTo(A, B, Distance,route(R1,R2,R3)) :  bicycleLane(A,C,D1),
								moped(C,B,D2),
								Distance 

					
addTo(X,[],[]).					
addTo(X, [H|T], [H1|T2]) :- H1 is X+H, addTo(X, T, T2).

 removeAll(X,[X|T],T).  
 removeAll(X,[Y|T],[Y|T1]):-
        removeAll(X,T,T1).			
freq([],X,0).
freq([X|T],X,Y):- freq(T,X,Z), Y is 1+Z.
freq([X1|T],X,Z):- X1\=X,freq(T,X,Z).