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

tramos_wrapper([_], []).
tramos_wrapper([Origen, Destino | Resto], [[Origen, Destino]| TramosResto]) :-
    tramos_wrapper([Destino | Resto], TramosResto).

% Obtener lista de todos los tramos usados por todos
todos_tramos_usuarios(ListaUsuarios, ListaTramos) :-
    findall(T, (member(P, ListaUsuarios), tramos(P, Tr), member(T, Tr)), ListaTramos).

% Calcular cuantas personas usan cada tramo
uso_tramos([Origen, Destino], ListaUsuarios, CantidadUso) :-
    todos_tramos_usuarios(ListaUsuarios, TodosTramos),
    include(=([Origen, Destino]), TodosTramos, Filtrados),
    length(Filtrados, CantidadUso).

% Calcular el costo de un tramo dividido por cantidad de usuarios
costos_divididos([Origen, Destino], ListaUsuarios, CostoDividido) :-
    uso_tramos([Origen, Destino], ListaUsuarios, CantidadUso),
    siguiente([Origen, Destino], Costo),
    CostoDividido is Costo / CantidadUso.

% Calculo de costos parciales
calcular_costos_parciales(_, [], _, 0).
calcular_costos_parciales(ListaUsuarios, [[O,D]|Resto], CostoTotal, Acumulador) :-
    costos_divididos([O,D], ListaUsuarios, CostoTramo),
    calcular_costos_parciales(ListaUsuarios, Resto, CostoTotal, Acum2),
    Acumulador is CostoTramo + Acum2.

% Wrapper
calcular_costos_parciales(Persona, ListaUsuarios, CostoTotal) :-
    tramos(Persona, Tramos),
    calcular_costos_parciales(ListaUsuarios, Tramos, CostoTotal, _).

% Funcion principal
repartir_costos(Solicitantes, Resultados) :-
    repartir_costos_wrapper(Solicitantes, Solicitantes, Resultados).

repartir_costos_wrapper(_, [], []).
repartir_costos_wrapper(Solicitantes, [Persona|Resto], [[Persona, Camino, Costo] | RestoResultado]) :-
    camino(Persona, Camino),
    calcular_costos_parciales(Persona, Solicitantes, Costo),
    repartir_costos_wrapper(Solicitantes, Resto, RestoResultado).
