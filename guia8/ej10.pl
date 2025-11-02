intercalar([],[],[]).
intercalar([],Y,Y):-Y\=[].
intercalar(X,[],X):-X\=[].
intercalar([X|XS],[Y|YS],[X,Y|RES]):- intercalar(XS,YS,RES).

%Es reversible (mientras hayan al menos dos listas instanciadas): 
%Si L1 y L2 están dadas, se construye L3.
%Si L3 está dada, se puede deducir L1 y L2.
%También se puede usar con una combinación parcial: por ejemplo, L1 y L3 dadas, deducir L2.
