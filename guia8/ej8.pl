%Definir el predicado parteQueSuma(+L,+S,-P) que es verdadero cuando P es una lista con elementos de L que
%suman S. Por ejemplo:
%?- parteQueSuma([1,2,3,4,5],9,P).
%P = [1, 3, 5] ;
%P = [2, 3, 4] ;
%P = [4, 5] ;
%false.
parteQueSuma([],N,[]):-N==0.
parteQueSuma([X|XS],N,RES):- N>=0, parteQueSuma(XS,N,RES).
parteQueSuma([X|XS],N,[X|RES]):- N1 is N-X, N1>=0, parteQueSuma(XS,N1,RES).