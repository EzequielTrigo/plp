%Un árbol binario se representará en Prolog con:
%nil, si es vacío.
%bin(izq, v, der), donde v es el valor del nodo, izq es el subárbol izquierdo y der es el subárbol derecho.
%Definir predicados en Prolog para las sig

vacio(nil).

raiz((_, V, _), V).

altura(nil,0).
altura((Izq, _, Der), Alt):- altura(Izq, Alt1), altura(Der, Alt2), Alt is 1 + max(Alt1,Alt2).

cantidadDeNodos(nil,0).
cantidadDeNodos((Izq,_,Der),Cant):- cantidadDeNodos(Izq,Cant1), cantidadDeNodos(Der,Cant2), Cant is 1+Cant1+Cant2.

%ej12

%Denir los siguientes predicados, utilizando la representación de árbol binario denida en el ejercicio 11:
%i. inorder(+AB,-Lista), que tenga éxito si AB es un árbol binario y Lista la lista de sus nodos según el
%recorrido inorder. ((nil,3,nil),1,(nil,1,nil))


inorder(nil,[]).
inorder(bin(Izq,V,Der),Res):- inorder(Izq,Res1), inorder(Der, Res2), append(Res1,[V|Res2],Res).

%ii. arbolConInorder(+Lista,-AB), versión inversa del predicado anterior.
arbolConInorder([],nil).
arbolConInorder(L,AB) :- append(LIzq,[V|LDer], L), arbolConInorder(LIzq,Izq), arbolConInorder(LDer,Der), AB=bin(Izq,V,Der).

%iii. aBB(+T), que será verdadero si T es un árbol binario de búsqueda.

aBB(nil).
aBB(bin(Izq,V,Der)):-aBB(Izq), aBB(Der), inorder(Izq,LIzq), todosMenores(LIzq,V), inorder(Der,LDer), todosMayores(LDer,V).

todosMenores([],_).
todosMenores([X|XS],Val):-X<Val,todosMenores(XS,Val).

todosMayores([],_).
todosMayores([X|XS],Val):-X>Val,todosMayores(XS,Val).

%bin(bin(bin(nil,1,nil), 2, bin(nil,3,nil)),5,bin(nil,6,nil))
%iv. aBBInsertar(+X, +T1, -T2), donde T2 resulta de insertar X en orden en el árbol T1. Este predicado ¾es
%reversible en alguno de sus parámetros? Justicar.

aBBInsertar(X,nil,bin(nil,X,nil)).
aBBInsertar(X,bin(Izq,V,Der),ResAB):- X<V, ResAB=bin(ResABI,V,Der), aBBInsertar(X,Izq,ResABI), aBB(ResAB).
aBBInsertar(X,bin(Izq,V,Der),ResAB):- X>V, ResAB=bin(Izq,V,ResABD), aBBInsertar(X,Der,ResABD), aBB(ResAB).