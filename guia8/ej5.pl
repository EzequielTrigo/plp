last([X], X).
last([_|XS],X) :- last(XS, X).

reverse2([X],[X]).
reverse2([Y|YS],R):- reverse(YS,YSR), append(YSR,[Y],R).

prefijo([],_).
prefijo([X|XS],[X|YS]):-prefijo(XS,YS).


sufijo(XS, L):-append(A,XS,L).



sublista(S, L) :- sufijo(Sufijos,L), prefijo(S,Sufijos).
