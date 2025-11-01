

% arranca unificando 5 con X y [5,6,5,3] con [X|[Y|Ls]]. como no se
% rompe la unificación (o sea, no estoy unificando X con dos cosas
% distintas...... ver guía 5), instancia Y con el segundo elemento de
% [5,6,5,3] (o sea 6). OK
% después unifica [5,6,5,3] con [W|Ls] (5|[6,5,3]) y hace un llamado 
% recursivo de esta forma: vecino(5, Y, [6,5,3]). vuelve al primer caso
% y acá sí se rompe la unificación porque va a querer unificar X = 5 con 
% X = 6 y no. entonces acá no instancia nada. 
% después va al segundo caso e instancia [W|Ls] con [6,5,3] (6|[5,3]) y
% hace un llamado recursivo de la forma vecino(5,Y,[5,3]).
% va al primer caso y acá si unifica. entonces instancia Y con 3.
% va al segundo llamado e instancia [5,3] con [W|Ls] (5|[3]) y hace
% un llamado recursivo de la forma vecino(5,Y,[3]).
% acá se rompe la unificación porque no puedo instanciar [X|[Y|Ls]]
% así que false y chau.

vecino(X, Y, [W|Ls]) :- vecino(X, Y, Ls).
vecino(X, Y, [X|[Y|Ls]]).