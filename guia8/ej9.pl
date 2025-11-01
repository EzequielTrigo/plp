%Considerar el siguiente predicado:

desde(X,X).
desde(X,Y) :- N is X+1, desde(N,Y).

%i. ¾Cómo deben instanciarse los parámetros para que el predicado funcione? (Es decir, para que no se cuelgue
%ni produzca un error). ¾Por qué?
%Tiene que ser desde(L+,T-),  Para que el predicado funcione, X debe estar instanciado e Y no debe estar instanciada porque sino devuelve true y luego se cuelga

%ii. Dar una nueva versión del predicado que funcione con la instanciación desdeReversible(+X,?Y), tal que
%si Y está instanciada, sea verdadero si Y es mayor o igual que X, y si no lo está genere todos los Y de X en
%adelante
desde2(X,X).
desde2(X,Y) :-nonvar(Y), X =< Y.
desde2(X,Y) :-  var(Y), N is X+1, desde(N,Y).
