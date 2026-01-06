% [pruebaTP].

localidades(['Cordoba Capital',
           'Carlos Paz',
           'Bialet Masse',
           'Valle Hermoso',
           'La Falda',
           'Huerta Grande',
           'La Cumbre',
           'Capilla del Monte']).

viaje(jorge,'Cordoba Capital','La Falda').
viaje(adriana,'Valle Hermoso','La Cumbre').
viaje(gabriela,'Carlos Paz','Capilla del Monte').
viaje(roberto,'Bialet Masse','Huerta Grande').
viaje(jose,'Cordoba Capital','Capilla del Monte').

% Función auxiliar para encontrar el camino (tramo) entre dos localidades
tramo(Destino, Destino, _, [Destino]) :- !.
% Caso recursivo: si el siguiente paso es el destino directo
tramo(Origen, Destino, [Destino|_], [Origen, Destino]) :-
    Origen \= Destino.

% Caso recursivo general: avanzar en la lista de pasos intermedios
tramo(Origen, Destino, [Ciudad|ColaLocalidades], [Origen | Recorrido]) :-
    Origen \= Destino,
    tramo(Ciudad, Destino, ColaLocalidades, Recorrido).
    

% Predicado principal que encuentra el camino(recorrido de todas las localidades) para una persona
camino(Persona, Recorrido) :- viaje(Persona, Origen, Destino),
                            localidades(ListLoca),
                            tramo(Origen, Destino, ListLoca, Recorrido).


% Predicado para encontrar todas las personas que pasan por una ciudad específica
% Recibe una ciudad y una lista de personas que pasan por esa ciudad
/*
personasPorCiudad(Ciudad, [Persona]) :- 
    camino(Persona, Recorrido),
    member(Ciudad, Recorrido).
    */


personasPorCiudad_aux(_, [], []).  % caso base
personasPorCiudad(Ciudad, [Persona|Personas]) :- 
    camino(Persona, Recorrido),
    member(Ciudad, Recorrido),
    Persona \= _.  % Evita duplicados
    . % HACER LA FUNCION MEMBER PARA VER SI LA CIUDAD ESTÁ EN EL RECORRIDO
