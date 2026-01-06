% [logicoPA].

%ANDAAAA

% % Córdoba Capital               $1500
% % Carlos Paz                    $1500
% % Bialet Massé                  $1000
% % Valle Hermoso                 $1200
% % La Falda                      $1000
% % Huerta Grande                 $1200
% % La Cumbre                     $1600
% % Capilla Del Monte
% localidades(['Cordoba Capital',
%            'Carlos Paz',
%            'Bialet Masse',
%            'Valle Hermoso',
%            'La Falda',
%            'Huerta Grande',
%            'La Cumbre',
%            'Capilla del Monte']).

% % Costo de los viajes entre localidades
% costo('Cordoba Capital','Carlos Paz',1500).
% costo('Carlos Paz','Bialet Masse',1500).
% costo('Bialet Masse','Valle Hermoso',1000).
% costo('Valle Hermoso','La Falda',1200).
% costo('La Falda','Huerta Grande',1000).
% costo('Huerta Grande','La Cumbre',1200).
% costo('La Cumbre','Capilla del Monte',1600).


% % ● Jorge viaja desde Córdoba Capital hasta La Falda.
% % ● Adriana arranca en Valle Hermoso y va hasta La Cumbre.
% % ● Gabriela sale desde Carlos Paz y termina en Capilla del Monte.
% % ● Roberto va desde Bialet Massé hasta Huerta Grande.
% % ● Jose recorre todo: desde Córdoba Capital hasta Capilla del Monte

% viaje(jorge,'Cordoba Capital','La Falda').
% viaje(adriana,'Valle Hermoso','La Cumbre').
% viaje(gabriela,'Carlos Paz','Capilla del Monte').
% viaje(roberto,'Bialet Masse','Huerta Grande').
% viaje(jose,'Cordoba Capital','Capilla del Monte').



% % camino_aux(Origen,Destino,[Origen,Destino]) :- 
% %     (Origen,Destino,_).
% camino(O,D,[],[]).
% camino(O,D,[X|Localidades],[X|Recorrido]):-
%     localidades(X),
%     X = O,
%     camino(O,D,Localidades,Recorrido).


% Hechos de los tramos entre localidades con sus costos
tramo('Cordoba Capital', 'Carlos Paz', 1500).
tramo('Carlos Paz', 'Bialet Masse', 1500).
tramo('Bialet Masse', 'Valle Hermoso', 1000).
tramo('Valle Hermoso', 'La Falda', 1200).
tramo('La Falda', 'Huerta Grande', 1000).
tramo('Huerta Grande', 'La Cumbre', 1200).
tramo('La Cumbre', 'Capilla del Monte', 1600).

% Hechos de los viajes de cada persona (origen y destino)
viaje(jorge, 'Cordoba Capital', 'La Falda').
viaje(adriana, 'Valle Hermoso', 'La Cumbre').
viaje(gabriela, 'Carlos Paz', 'Capilla del Monte').
viaje(roberto, 'Bialet Masse', 'Huerta Grande').
viaje(jose, 'Cordoba Capital', 'Capilla del Monte').

% Predicado para generar el camino entre dos localidades
camino(Inicio, Fin, [Inicio]) :- Inicio == Fin.
camino(Inicio, Fin, [Inicio|Resto]) :-
    Inicio \== Fin,
    tramo(Inicio, Sig, _),
    camino(Sig, Fin, Resto).

% Predicado para obtener la lista de tramos a partir de un camino
caminotramos([_], []).
caminotramos([A,B|T], [tramo(A,B)|Rest]) :- caminotramos([B|T], Rest).

% Predicado auxiliar: verifica si un elemento pertenece a una lista
pertenece(X, [X|_]).
pertenece(X, [_|Xs]) :- pertenece(X, Xs).

% Predicado para contar cuántas personas en una lista de información usan un tramo específico
count_matching([], _, 0).
count_matching([_-(_,Tramos)|Rest], T, Count) :-
    count_matching(Rest, T, C1),
    (pertenece(T, Tramos) -> Count is C1 + 1 ; Count = C1).

% Predicado para construir una lista con la información de caminos y tramos de cada persona
construir_lista_caminos_y_tramos([], []).
construir_lista_caminos_y_tramos([P|Ps], [P-(Camino, TramosP) | Rest]) :-
    viaje(P, Inicio, Fin),
    camino(Inicio, Fin, Camino),
    caminotramos(Camino, TramosP),
    construir_lista_caminos_y_tramos(Ps, Rest).

% Predicado para calcular el costo total de una persona basado en sus tramos
calcular_costo([], _, Acum, Acum).
calcular_costo([T|Tramos], Info, Acum, CostoTotal) :-
    T = tramo(A,B),
    tramo(A,B,CostoT),
    count_matching(Info, T, Count),
    (Count > 0 -> Contribucion is CostoT / Count ; Contribucion = 0),
    Acum1 is Acum + Contribucion,
    calcular_costo(Tramos, Info, Acum1, CostoTotal).

% Predicado auxiliar para procesar cada persona y generar el resultado
repartir_costos_aux([], _, []).
repartir_costos_aux([P-(Camino, TramosP) | Rest], Info, [[P, Camino, CostoTotal] | RestResult]) :-
    calcular_costo(TramosP, Info, 0, CostoTotal),
    repartir_costos_aux(Rest, Info, RestResult).

% Predicado principal: reparte los costos entre las personas indicadas
repartir_costos(Personas, Resultado) :-
    construir_lista_caminos_y_tramos(Personas, Info),
    repartir_costos_aux(Info, Info, Resultado).