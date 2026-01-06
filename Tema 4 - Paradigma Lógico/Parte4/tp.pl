% [tp].

% Córdoba Capital               $1500
% Carlos Paz                    $1500
% Bialet Massé                  $1000
% Valle Hermoso                 $1200
% La Falda                      $1000
% Huerta Grande                 $1200
% La Cumbre                     $1600
% Capilla Del Monte
localidades(['Cordoba Capital',
           'Carlos Paz',
           'Bialet Masse',
           'Valle Hermoso',
           'La Falda',
           'Huerta Grande',
           'La Cumbre',
           'Capilla del Monte']).

% Costo de los viajes entre localidades
costo('Cordoba Capital','Carlos Paz',1500).
costo('Carlos Paz','Bialet Masse',1500).
costo('Bialet Masse','Valle Hermoso',1000).
costo('Valle Hermoso','La Falda',1200).
costo('La Falda','Huerta Grande',1000).
costo('Huerta Grande','La Cumbre',1200).
costo('La Cumbre','Capilla del Monte',1600).


% ● Jorge viaja desde Córdoba Capital hasta La Falda.
% ● Adriana arranca en Valle Hermoso y va hasta La Cumbre.
% ● Gabriela sale desde Carlos Paz y termina en Capilla del Monte.
% ● Roberto va desde Bialet Massé hasta Huerta Grande.
% ● Jose recorre todo: desde Córdoba Capital hasta Capilla del Monte

viaje(jorge,'Cordoba Capital','La Falda').
viaje(adriana,'Valle Hermoso','La Cumbre').
viaje(gabriela,'Carlos Paz','Capilla del Monte').
viaje(roberto,'Bialet Masse','Huerta Grande').
viaje(jose,'Cordoba Capital','Capilla del Monte').


camino_aux(Origen, Origen, _, [Origen]) :- !.
% Caso recursivo: si el siguiente paso es el destino directo
camino_aux(Origen, Destino, [Destino|_], [Origen, Destino]) :-
    Origen \= Destino.

% Caso recursivo general: avanzar en la lista de pasos intermedios
camino_aux(Origen, Destino, [Paso|Resto], [Origen | Recorrido]) :-
    Origen \= Destino,
    camino_aux(Paso, Destino, Resto, Recorrido).


/*
% caminoaux(Origen,Destino,[Origen,Destino]) :- 
%     (Origen,Destino,).
%camino_aux(Origen, Destino, [], [Origen, Destino]) :- Origen = Destino.
%camino_aux(Origen, Destino, [Destino|ColaLoc], [Destino|Recorrido]).
camino_aux(Origen, Destino, [X|ColaLoc], [X|Recorrido]) :-
    X = Origen,
    [Y|ColaLoc1] = ColaLoc,
    camino_aux(Y, Destino, ColaLoc, Recorrido).
*/


/*
camino_aux(Origen, Destino, [Destino|ColaLoc], [Destino|Recorrido]).
camino_aux(Origen, Destino, [X|ColaLoc], [X|Recorrido]) :-
    X = Origen,
    [Y|ColaLoc1] is ColaLoc,
    camino_aux(Y, Destino, ColaLoc, Recorrido).
*/


camino(Persona,Recorrido) :- viaje(Persona,Origen,Destino), 
                            localidades(ListLoca),
                            camino_aux(Origen, Destino, ListLoca, Recorrido).


lista1([a,b,c,d,e]).


contar(,[], 0).
contar(Num, [X|T], Cant) :- Num==X ,contar(Num, T, Cant1), Cant is Cant1 + 1.
contar(Num, [X|T], Cant) :- Num = X, contar(Num, T, Cant).