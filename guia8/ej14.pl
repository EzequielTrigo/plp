desde(X, X).
desde(X, Y) :- var(Y), N is X+1, desde(N, Y).
desde(X, Y) :- nonvar(Y), X < Y. % ojo repite si =<

cuadradoSemiMágico(Y,X) :- desde(0,Z), esCuadradoMagicoDeTamYVal(Y,Y,X,Z), esCuadradoMagicoDe(X,Z).

esCuadradoMagicoDeTamYVal(0,_,[],_).
esCuadradoMagicoDeTamYVal(Tamaño, Largo ,[X|XS], Val):- Tamaño>0, listaQueSuma(Largo,X,Val), TM1 is Tamaño-1, esCuadradoMagicoDeTamYVal(TM1, Largo ,XS, Val).

listaQueSuma(0,[],0).
listaQueSuma(Tamaño,[X|XS], Val):- Tamaño>0, between(0,Val, N), X is N, TM1 is Tamaño-1, VM1 is Val-N, listaQueSuma(TM1, XS,VM1).

esCuadradoMagicoDe([], _).
esCuadradoMagicoDe([X|XS], Z):- sum_list(X, Z), esCuadradoMagicoDe(XS,Z).

cuadradoSemiMágico2(Y,X) :- desde(0,Z), matrizDeTamConValoresNoMayoresA(Y,Y,X,Z), esCuadradoMagicoDe(X,Z).

matrizDeTamConValoresNoMayoresA(0,_,[],_).
matrizDeTamConValoresNoMayoresA(Tamaño, Largo ,[X|XS], Val):- Tamaño>0, listaTienenMenores(Largo,X,Val), TM1 is Tamaño-1, matrizDeTamConValoresNoMayoresA(TM1, Largo ,XS, Val).

listaTienenMenores(0,[],_).
listaTienenMenores(Tamaño,[X|XS], Val):- Tamaño>0, between(0,Val, N), X is N, TM1 is Tamaño-1, listaTienenMenores(TM1, XS, Val).