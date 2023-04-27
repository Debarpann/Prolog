sum(X,Y,Z) :- Z is X+Y.

max(X,Y,M) :- X>=Y, M is X.
max(X,Y,M) :- Y>=X, M is Y.

fac(0,1).
fac(N,F) :- N>0, N1 is N-1, fac(N1,F1), F is F1*N.

fib(0,0).
fib(1,1).
fib(N,F) :- N>0,N1 is N-1, fib(N1,F1), N2 is N-2, fib(N2,F2), F is F1+F2.

pow(_,0,1).
pow(X,Y,Z) :- X>0, Y1 is Y-1, pow(X,Y1,Z1), Z is Z1*X.


gcd(X,Y,Z):- X=Y, Z is X.
gcd(X,Y,Z):- X>Y, X1 is X-Y, gcd(X1,Y,Z).
gcd(X,Y,Z):- Y>X, Y1 is Y-X, gcd(X,Y1,Z).

mul(X,Y,Z):- Z is X*Y.

mem(H,[H|_]).
mem(X, [_|T]):- mem(X,T).

conc([],L2,L2).
conc([H1|L1],L2,[H1|L3]):- conc(L1,L2,L3). 

reverse([], []).
reverse([H|T], R) :- reverse(T, TRev), append(TRev, [H], R).

palindrome(L) :- reverse(L, L).

sumlist([], 0).
sumlist([H|T], S) :- sumlist(T, ST), S is H + ST.

evenlength([]).
evenlength([_|T]) :- oddlength(T).

oddlength([_]).
oddlength([_|T]) :- evenlength(T).

nth_element(1, [H|_], H).
nth_element(N, [_|T], X) :- N > 1, N1 is N-1, nth_element(N1, T, X).

maxlist([X], X).
maxlist([H|T], M) :- maxlist(T, M1), (H > M1 -> M is H ; M is M1).

insert_nth(I, 1, L, [I|L]).
insert_nth(I, N, [H|T], [H|R]) :- N > 1, N1 is N-1, insert_nth(I, N1, T, R).

delete_nth(1, [_|T], T).
delete_nth(N, [H|T], [H|R]) :- N > 1, N1 is N-1, delete_nth(N1, T, R).

merge([], L2, L2).
merge(L1, [], L1).
merge([H1|T1], [H2|T2], [H1|T3]) :- H1 =< H2, merge(T1, [H2|T2], T3).
merge([H1|T1], [H2|T2], [H2|T3]) :- H2 < H1, merge([H1|T1], T2, T3).
