desde(X, X).
desde(X, Y) :- var(Y), N is X+1, desde(N, Y).
desde(X, Y) :- nonvar(Y), X < Y. % ojo repite si =<

%esTriángulo(+T) que, dada una estructura de la forma tri(A,B,C), indique si es un triángulo válido.
%En un triángulo válido, cada lado es menor que la suma de los otros dos, y mayor que su diferencia (y
%obviamente mayor que 0).

esTriángulo(X,Y,Z) :- ladosMenorALaSuma(X,Y,Z), ladosMayorADif(X,Y,Z).

ladosMenorALaSuma(X,Y,Z) :- XY is X+Y, XZ is X+Z, YZ is Y+Z, X< YZ, Y < XZ, Z < XY.

ladosMayorADif(X,Y,Z) :- XY is X-Y, XZ is X-Z, YZ is Y-Z, X > YZ, Y > XZ, Z > XY.

%perímetro(?T,?P), que es verdadero cuando T es un triángulo (válido) y P es su perímetro. No
%se deben generar resultados repetidos (no tendremos en cuenta la congruencia entre triángulos: si
%dos triángulos tienen las mismas longitudes, pero en diferente orden, se considerarán diferentes entre sí). El predicado debe funcionar para cualquier instanciación de T y P (ambas instanciadas, ambas sin instanciar, una instanciada y una no; no es necesario que funcione para triángulos parcialmente instanciados), debe generar todos los resultados válidos (sean nitos o innitos), y no debe colgarse (es decir, no debe seguir ejecutando innitamente sin producir nuevos resultados). Por ejemplo:
%?- perímetro(tri(3,4,5),12). → true.
%?- perímetro(T,5). → T = tri(1, 2, 2) ; T = tri(2, 1, 2) ; T = tri(2, 2, 1) ; false.
%?- perímetro(tri(2,2,2),P). → P = 6.
%?- perímetro(T,P). → T = tri(1, 1, 1), P = 3 ; T = tri(1, 2, 2), P = 5 ; . . .
perimetro(tri(X,Y,Z), Per):- ground(tri(X,Y,Z)), esTriángulo(X,Y,Z),  Per is X+Y+Z.
perimetro(tri(X,Y,Z), Per):- not(ground(tri(X,Y,Z))), generarPosiblesTriangulos(tri(X,Y,Z)), esTriángulo(X,Y,Z) , Per is X+Y+Z.

generarPosiblesTriangulos(tri(X,Y,Z)):- desde(1,N), between(1,N,X), N1 is N-X, between(1,N1,Y), Z is N1-Y.

triangulo(tri(X,Y,Z)):- generarPosiblesTriangulos(tri(X,Y,Z)), esTriángulo(tri(X,Y,Z)).