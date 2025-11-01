juntar([],[],[]).
juntar([X|XS],Y,[X|LS]):-juntar(XS,Y,LS).
juntar([],[Y|YS],[Y|LS]):-juntar([],YS,LS).