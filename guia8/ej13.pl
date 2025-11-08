desde(X, X).
desde(X, Y) :- var(Y), N is X+1, desde(N, Y).
desde(X, Y) :- nonvar(Y), X < Y. % ojo repite si =<

generarPares(X,Y):- desde(1,N), between(1,N,X), Y is N-X.

coprimos(X,Y) :- generarPares(X,Y) , gcd(X,Y) =:= 1.
