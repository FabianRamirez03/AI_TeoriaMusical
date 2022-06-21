%           _________________________________
% _________/ Definicion de sucesion de notas \_________
%          \_________________________________/
% do
siguiente_semitono(do, do_sostenido).
siguiente_semitono(do, re_bemol).
siguiente_semitono(do_sostenido, re).
% re
siguiente_semitono(re_bemol, re).
siguiente_semitono(re, re_sostenido).
siguiente_semitono(re, mi_bemol).
siguiente_semitono(re_sostenido, mi).
% mi
siguiente_semitono(mi_bemol, mi).
siguiente_semitono(mi, fa).
% fa
siguiente_semitono(fa, fa_sostenido).
siguiente_semitono(fa, sol_bemol).
siguiente_semitono(fa_sostenido, sol).
% sol
siguiente_semitono(sol_bemol, sol).
siguiente_semitono(sol, sol_sostenido).
siguiente_semitono(sol, la_bemol).
siguiente_semitono(sol_sostenido, la).
% la
siguiente_semitono(la, la_sostenido).
siguiente_semitono(la_sostenido, si).
% si
siguiente_semitono(si_b, si).
siguiente_semitono(si, do).

%           __________________________
% _________/ Definicion de intervalos \_________
%          \__________________________/
intervalo(unisono, 0).
intervalo(segunda_menor, 1).
intervalo(segunda_mayor, 2).
intervalo(tercera_menor, 3).
intervalo(tercera_mayor, 4).
intervalo(cuarta, 5).
intervalo(quinta, 7).
intervalo(sexta_menor, 8).
intervalo(sexta_mayor, 9).
intervalo(setima_menor, 10).
intervalo(setima_mayor, 11).
intervalo(octava, 12).


nota_at_intervalo(Nota, Intervalo, Result):-intervalo(Intervalo, Distancia), get_nota(Nota, Distancia, Result).

get_nota(Nota, Distancia, Result):- Distancia==1, siguiente_semitono(Nota, Result).
get_nota(Nota, Distancia, Result):- Distancia>1, siguiente_semitono(Nota, Sig), Dist is Distancia -1, get_nota(Sig, Dist, Result).



acorde(N1, N2, N3, Tipo, Nombre):-
    acorde_mayor_fundamental(N1, Result), Result == [N1, N2, N3], acorde_generado(Tipo,'fundamental'), atom_concat(N1,'_mayor', Nombre);
    acorde_menor_fundamental(N1, Result), Result == [N1, N2, N3], acorde_generado(Tipo,'fundamental'), atom_concat(N1,'_menor', Nombre).




%get_acorde(Nota1, Nota2, Nota3, Nombre, Tipo):-
    % Acorde mayor

acorde_fundamental(Nota, Tipo, Acorde):-
    Tipo == mayor, acorde_mayor_fundamental(Nota, Acorde);
    Tipo == menor, acorde_menor_fundamental(Nota, Acorde).

acorde_mayor_fundamental(Nota, Result):-
    nota_at_intervalo(Nota, tercera_mayor, Nota2),
    nota_at_intervalo(Nota, quinta, Nota3),
    acorde_generado([Nota, Nota2, Nota3], Result).

acorde_menor_fundamental(Nota, Result):-
    nota_at_intervalo(Nota, tercera_menor, Nota2),
    nota_at_intervalo(Nota, quinta, Nota3),
    acorde_generado([Nota, Nota2, Nota3], Result).

acorde_generado(X, X).

