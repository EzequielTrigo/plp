natural(0).
natural(suc(X)) :- natural(X).
menorOIgual(X, suc(Y)) :- natural(Y),menorOIgual(X, Y).
menorOIgual(X,X) :- natural(X).



