% [prueba].

% Verifico si está en la lista el elemento p/ evitar bucles:
miembro(X,[X|_]):- !.
miembro(X,[_|R]):- miembro(X,R).
% Función que valida la que la lista no tenga repetidos.
valido([]):- !.
valido([X|R]):- miembro(X,R), !, fail.
valido([_|R]):- valido(R).

% Invertir una lista
revertir(Lista, Reversa) :-
    reverse_aux(Lista, [], Reversa).
reverse_aux([], Acumulador, Acumulador).  % caso base: lista vacía

reverse_aux([Cabeza|Cola], Acumulador, Reversa) :-
    reverse_aux(Cola, [Cabeza|Acumulador], Reversa).


% Base de conocimiento (tramos y viajes)
tramo('Cordoba Capital', 'Carlos Paz', 1500).
tramo('Carlos Paz', 'Bialet Masse', 1500).
tramo('Bialet Masse', 'Valle Hermoso', 1000).
tramo('Valle Hermoso', 'La Falda', 1200).
tramo('La Falda', 'Huerta Grande', 1000).
tramo('Huerta Grande', 'La Cumbre', 1200).
tramo('La Cumbre', 'Capilla del Monte', 1600).

viaje(jorge, 'Cordoba Capital', 'La Falda').
viaje(adriana, 'Valle Hermoso', 'La Cumbre').
viaje(gabriela, 'Carlos Paz', 'Capilla del Monte').
viaje(roberto, 'Bialet Masse', 'Huerta Grande').
viaje(jose, 'Cordoba Capital', 'Capilla del Monte').

% Predicado principal
camino(Persona, Recorrido) :-
    viaje(Persona, Origen, Destino),
    encontrar_camino(Origen, Destino, [Origen], Recorrido).

% Caso base: llegamos al destino
encontrar_camino(Destino, Destino, Visitados, Recorrido) :-
    revertir(Visitados, Recorrido).

% Caso recursivo: encontrar siguiente paso
encontrar_camino(Actual, Destino, Visitados, Recorrido) :-
    tramo(Actual, Siguiente, _),
    not(miembro(Siguiente, Visitados)) ,
    encontrar_camino(Siguiente, Destino, [Siguiente | Visitados], Recorrido).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Predicado para obtener la lista de tramos con costo
tramos_recorrido([_], []).  % Caso base: solo queda una localidad
tramos_recorrido([Loc1, Loc2 | Rest], [tramo(Loc1, Loc2, Costo) | Tramos]) :-
    tramo(Loc1, Loc2, Costo),  % Busca el tramo directo
    tramos_recorrido([Loc2 | Rest], Tramos).

% Predicado combinado: persona -> lista de tramos
tramos_persona(Persona, ListaTramos) :-
    camino(Persona, Recorrido),
    tramos_recorrido(Recorrido, ListaTramos).
