
%punto 1
%a
honesto(roque).
honesto(ana).
contador(roque).
ambicioso(roque).
ingeniera(ana).
abogada(cecilia).

%b

trabajaron(roque, utn).
trabajaron(cecilia, utn).

puedeAndar(contaduria, Empleado):-
    honesto(Empleado).

puedeAndar(ventas, Empleado):-
    ambicioso(Empleado),
    trabajaron(Empleado, _).

puedeAndar(ventas, lucia).

%punto 2

viveMansion(tiaAgatha).
viveMansion(carnicero).
viveMansion(charles).

asesino(tiaAgatha, Asesino):-
    viveMansion(Asesino),
    odia(Asesino, tiaAgatha),
    not(rico(tiaAgatha, Asesino)).

odia(tiaAgatha, PersonaOdiada):-
    viveMansion(PersonaOdiada),
    PersonaOdiada\=carnicero.

odia(carnicero, PersonaOdiada):-
    odia(tiaAgatha, PersonaOdiada).

%charles odia al carnicero
%agatha odia a agatha y a charles
%carnicero odia a agatha y a charles

odia(charles, PersonaOdiada):-
    viveMansion(PersonaOdiada),
    not(odia(tiaAgatha, PersonaOdiada)).

%el unico mas rico que la tia agatha es el carnicero

rico(tiaAgatha, MasRico):-
    viveMansion(MasRico),
    not(odia(carnicero, MasRico)).

:- begin_tests(tp1).
test(un_contador_honesto_puede_trabajar_en_contaduria, nondet):-
    puedeAndar(contaduria, roque).

test(tia_Agatha_odia_a_los_que_viven_en_la_mansion_excepto_al_carnicero, nondet):-
    odia(tiaAgatha, tiaAgatha),
    odia(tiaAgatha, charles).

test(charles_odia_a_los_que_viven_en_la_mansion_no_odiadas_por_tia_Agatha, nondet):-
    odia(charles, carnicero).

test(carnicero_odia_a_los_mismos_que_tia_Agatha, nondet):-
    odia(carnicero, tiaAgatha),
    odia(carnicero, charles).

:- end_tests(tp1).