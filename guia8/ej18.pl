corteMasParejo(L,LI,LD):- append(LI,LD,L), sum_list(LI,SI), sum_list(LD,SD), DIFF is abs(SI-SD), not(existeCorteConMenosDiferencia(L,DIFF)).

existeCorteConMenosDiferencia(L,DIFF):- append(LI,LD,L), sum_list(LI,SI), sum_list(LD,SD), DIFF2 is abs(SI-SD), DIFF>DIFF2.
