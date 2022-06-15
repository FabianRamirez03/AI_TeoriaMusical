nota(do).
nota(do_sostenido).
nota(re).
nota(re_sostenido).
nota(mi).
nota(fa).
nota(fa_sostenido).
nota(sol).
nota(la).
nota(la_sostenido).
nota(si).


nota_siguiente(do, do_sostenido).
nota_siguiente(do_sostenido, re).
nota_siguiente(re, re_sostenido).
nota_siguiente(re_sostenido, mi).
nota_siguiente(mi, fa).
nota_siguiente(fa, fa_sostenido).
nota_siguiente(fa_sostenido, sol).
nota_siguiente(sol, la).
nota_siguiente(la, la_sostenido).
nota_siguiente(la_sostenido, si).
nota_siguiente(si, do).


encontrar_nota_siguiente(Nota, Semitonos, Nota_Siguiente):- Semitonos == 1, nota_siguiente(Nota, Nota_Siguiente).
encontrar_nota_siguiente(Nota, Semitonos, Nota_Incognita):-
    Semitonos > 1,
    ST1 is Semitonos - 1,
    nota_siguiente(Nota, Nota_Siguiente),
    encontrar_nota_siguiente(Nota_Siguiente, ST1, Nota_Incognita).







