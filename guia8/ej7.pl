interseccion([], _, []). 
interseccion([X|XS], YS, L)    :-     member(X,XS)                    , interseccion(XS,YS,L).
interseccion([X|XS], YS, L)    :- not(member(X,XS)), not(member(X,YS)), interseccion(XS,YS,L).
interseccion([X|XS], YS, [X|L]):- not(member(X,XS)),     member(X,YS) , interseccion(XS,YS,L).

%partir(N, L, L1, L2)
partir(0, L, [], L).
partir(N, [L|LR], [L|XS], L2):- N1 is N-1 ,partir(N1, LR, XS, L2).

%borrar(+ListaOriginal, +X, -ListaSinXs)
borrar([],_,[]).
borrar([L|LS],X,[L|RES]):- L\=X,borrar(LS,X,RES).
borrar([X|LS],X,RES):- borrar(LS,X,RES).

%sacarDuplicados(+L1, -L2)
sacarDuplicados([],[]).
sacarDuplicados([X|XS],[X|RES]):- not(member(X,XS)), sacarDuplicados(XS,RES).
sacarDuplicados([X|XS],RES):- member(X,XS), sacarDuplicados(XS,RES).

%permutación(+L1, ?L2)
insertar(X, L, LX) :-append(A, B, L), append(A, [X|B], LX).    % L está compuesto por A y B % entre A y B meto a X, que resulta en LX


permutación([],[]).
permutación([X|XS],L):-permutación(XS,Q),insertar(X,Q,L).

%reparto(+L, +N, -LListas)
reparto(L,1,[L]).
reparto(L,N,[Lista|Ls]):-N>1,N1 is N-1, append(Lista,A,L), reparto(A,N1,Ls).

%repartoSinVacías(+L, -LListas) 

repartoSinVacías(L,[L]).
repartoSinVacías(L,[Lista|Ls]):-append(Lista,A,L), Lista\=[], A\=[],repartoSinVacías(A,Ls).