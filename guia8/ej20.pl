desde(X, X).
desde(X, Y) :- var(Y), N is X+1, desde(N, Y).
desde(X, Y) :- nonvar(Y), X < Y. % ojo repite si =<

próximoNumPoderoso(X,Y):- X>0, XM1 is X+1, desde(XM1,Y), todosSusFactoresEstanElevadosAlCuadrado(Y), !.

todosSusFactoresEstanElevadosAlCuadrado(1).
todosSusFactoresEstanElevadosAlCuadrado(X):-X>1, between(2,X,Y), esPrimo(Y), not(X<Y), X2 is X//Y, 0 is X mod Y, X3 is X2//Y,0 is X2 mod Y, todosSusFactoresEstanElevadosAlCuadrado(X3), !.

esPrimo(X):-nonvar(X),X>1, not(existeUnNUmeroDivisorDiferenteAUno(X)).
esPrimo(X):-var(X), desde(2,X), X>1, not(existeUnNUmeroDivisorDiferenteAUno(X)).

existeUnNUmeroDivisorDiferenteAUno(X) :- Xm1 is X-1 ,between(2,Xm1,Z) , gcd(X,Z)=\=1. 