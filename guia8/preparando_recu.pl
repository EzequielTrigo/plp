desde(N,N).
desde(X,S):- XM1 is X+1, desde(XM1,S).

esRotacion(XS,RS):- append(XD,XI,XS),append(XI,XD,RS).

collatz(N,N).
collatz(N,S):- N>1,0 is N mod 2, N2 is N/2, collatz(N2,S).
collatz(N,S):- N>1,1 is N mod 2, N2 is (3*N)+1, collatz(N2,S).