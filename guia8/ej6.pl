aplanar([],[]).
aplanar([[]|XS],L):-aplanar(XS,L).
aplanar([X|YS],[X|L]):-X\=[],X\=[_|_],aplanar(YS,L).
aplanar([[X|YS]|XS],L):-aplanar([X,YS|XS],L).
