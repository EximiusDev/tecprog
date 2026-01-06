% [tp_H].

% Hechos: Viajes de cada persona (Persona, Origen, Destino)
viaja(jorge, 'Cordoba Capital', 'La Falda').
viaja(adriana, 'Valle Hermoso', 'La Cumbre').
viaja(gabriela, 'Carlos Paz', 'Capilla del Monte').
viaja(roberto, 'Bialet Masse', 'Huerta Grande').
viaja(jose, 'Cordoba Capital', 'Capilla del Monte').

% Hechos: Tramo entre localidades consecutivas con su costo (LocalidadActual, SiguienteLocalidad, Costo)
siguiente(['Cordoba Capital', 'Carlos Paz'], 1500).
siguiente(['Carlos Paz', 'Bialet Masse'], 1500).
siguiente(['Bialet Masse', 'Valle Hermoso'], 1000).
siguiente(['Valle Hermoso', 'La Falda'], 1200).
siguiente(['La Falda', 'Huerta Grande'], 1000).
siguiente(['Huerta Grande', 'La Cumbre'], 1200).
siguiente(['La Cumbre', 'Capilla del Monte'], 1600).


% Predicado: Obtiene el camino de una persona (Persona, ListaCamino)
camino(Persona, Camino) :-
    viaja(Persona, Origen, Destino),
    camino_wrapper(Origen, Destino, Camino).

% Predicado: Construye el camino entre Origen y Destino (Origen, Destino, ListaCamino)
camino_wrapper(Destino, Destino, [Destino]).
camino_wrapper(Origen, Destino, [Origen | Resto]) :-
    siguiente([Origen, Siguiente], _),
    camino_wrapper(Siguiente, Destino, Resto).

% Funcion para juntar tramos
tramos(Persona, Tramos) :-
    camino(Persona, Camino),
    tramos_wrapper(Camino, Tramos).

% Para cuando la lista de caminos esta vacia
tramos_wrapper([_], []).  % Caso base: 1 localidad -> no hay tramos

% Recursion
tramos_wrapper([Origen, Destino | Resto], [[Origen, Destino]| TramosResto]) :-
    tramos_wrapper([Destino | Resto], TramosResto).


% Predicado principal
uso_tramos([Origen, Destino], Cantidad_uso) :-
    siguiente([Origen, Destino], _),
    uso_tramo_solo([Origen, Destino], 0, Cantidad_uso). % Inicializamos el acumulador en 0

% Para el calculo de cada tramo
uso_tramo_solo([Origen, Destino], Acumulador, Cantidad_uso) :-
    findall(P, tramos(P, _), Personas), % Obtenemos todas las personas
    uso_tramo_solo_wrapper([Origen, Destino], Personas, Acumulador, Cantidad_uso).

% Para lista de personas vacía
uso_tramo_solo_wrapper(_, [], Acumulador, Acumulador).

% Recursion
uso_tramo_solo_wrapper([Origen, Destino], [Persona|Resto], Acumulador, Cantidad_uso) :-
    tramos(Persona, Tramos),
    (member([Origen, Destino], Tramos) -> 
        NuevoAcumulador is Acumulador + 1
    ; 
        NuevoAcumulador is Acumulador
    ),
    uso_tramo_solo_wrapper([Origen, Destino], Resto, NuevoAcumulador, Cantidad_uso).

% Division de costos
costos_divididos([Origen, Destino], Costo_dividido) :-
    uso_tramos([Origen, Destino], Cantidad_uso),
    siguiente([Origen, Destino], Costo),
    Costo_dividido is Costo/Cantidad_uso.

% Calculo de costos parciales
calcular_costos_parciales(Persona, Costo_parcial) :-
    tramos(Persona, Tramo),
    calcular_aux(Tramo, Costo_parcial, 0).

% Para lista de tramos vacía
calcular_aux([], Sumador, Sumador).

% Recursion
calcular_aux([Primero | Resto], Costo_parcial, Sumador) :-
    costos_divididos(Primero, Costo_x_tramo),
    SumadorNuevo is Sumador + Costo_x_tramo,
    calcular_aux(Resto, Costo_parcial, SumadorNuevo).

% Funcion principal
repartir_costos(Solicitantes, Resultados) :-
    repartir_costos_wrapper(Solicitantes, Resultados).

% Para cuando la lista de personas es vacia   
repartir_costos_wrapper([],[]).

% Recursion
repartir_costos_wrapper([Primero | Resto], [[Primero, Tramos, Costo_parcial] | Resultados]) :-
    tramos(Primero, Tramos),
    calcular_costos_parciales(Primero, Costo_parcial),
    repartir_costos_wrapper(Resto, Resultados).


