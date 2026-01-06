% [tpiLogico].

%ANDAAAA 

% Hechos: Viajes de cada persona (Persona, Origen, Destino)
viaja(jorge, 'Cordoba Capital', 'La Falda').
viaja(adriana, 'Valle Hermoso', 'La Cumbre').
viaja(gabriela, 'Carlos Paz', 'Capilla del Monte').
viaja(roberto, 'Bialet Masse', 'Huerta Grande').
viaja(jose, 'Cordoba Capital', 'Capilla del Monte').

% Hechos: Tramo entre localidades consecutivas con su costo
siguiente('Cordoba Capital', 'Carlos Paz', 1500).
siguiente('Carlos Paz', 'Bialet Masse', 1500).
siguiente('Bialet Masse', 'Valle Hermoso', 1000).
siguiente('Valle Hermoso', 'La Falda', 1200).
siguiente('La Falda', 'Huerta Grande', 1000).
siguiente('Huerta Grande', 'La Cumbre', 1200).
siguiente('La Cumbre', 'Capilla del Monte', 1600).

% Verifico si está en la lista el elemento p/ evitar bucles:
miembro(X,[X|_]). %  % miembro(X, [X|_]):- !.      % Necesitamos que nos devuelva cada mienbro de la lista, por eso no usamos !
miembro(X,[_|Resto]):- miembro(X,Resto).

% Predicado principal: invertir(ListaOriginal, ListaInvertida)
invertir(Lista, Invertida) :-
    invertir_aux(Lista, [], Invertida).

invertir_aux([], Acum, Acum).% Caso base: cuando la lista original está vacía, el acumulador contiene el resultado.

% Caso recursivo: toma el primer elemento de la lista y lo añade al acumulador.
invertir_aux([Cabeza|Cola], Acum, Resultado) :-
    invertir_aux(Cola, [Cabeza|Acum], Resultado).

negacion(X):- X,!,fail.    % % Negación: si X es verdadero, falla; si es falso, continúa.

% Predicado: Obtiene el camino de una persona
camino(Persona, Camino) :-
    viaja(Persona, Origen, Destino),
    encontrar_camino(Origen, Destino, [Origen], RevCamino),
    invertir(RevCamino, Camino).

% Caso base: llegamos al destino, devolvemos la lista de visitados (el camino entero)
encontrar_camino(Destino, Destino, Visitados, Visitados).

% Caso recursivo: encontrar siguiente paso
encontrar_camino(Actual, Destino, Visitados, Camino) :-
    Actual \= Destino,
    siguiente(Actual, Siguiente, _),
    \+ miembro(Siguiente, Visitados),      %Verifico que no esté en la lista de visitados 
    %negacion(miembro(Siguiente, Visitados) ),
    encontrar_camino(Siguiente, Destino, [Siguiente | Visitados], Camino).


% Obtener los tramos del camino
tramos(Persona, Tramos) :-
    camino(Persona, Camino),
    obtener_tramos(Camino, Tramos).

% Convertir lista de localidades en lista de tramos
obtener_tramos([_], []).    % Caso base: si solo queda una localidad, no hay tramos.
obtener_tramos([Origen, Destino|Resto], [[Origen, Destino] | Tramos]) :-
    obtener_tramos([Destino|Resto], Tramos). % tomo los dos primeros elementos como un tramo y sigo con el resto de la lista.

% Contar cuántas personas usan un tramo específico
uso_tramo(Tramo, Solicitantes, Cantidad) :-
    findall(1, 
            ( miembro(Persona, Solicitantes),       % 1. Recorre cada Persona en la lista Solicitantes
              tramos(Persona, TramosPersona),      % 2. Recupera la lista de tramos que usa esa Persona
              miembro(Tramo, TramosPersona)        % 3. Verifica si el Tramo buscado está en su lista
            ), 
            Usos),                                  % 4. Por cada éxito, añade un “1” a la lista Usos
    length(Usos, Cantidad).                       % 5. La longitud de Usos es el Número de personas que usan ese tramo


% Calcular costo dividido para un tramo para cada solicitante
costo_dividido([Origen, Destino], Solicitantes, CostoDividido) :-
    siguiente(Origen, Destino, Costo),
    uso_tramo([Origen, Destino], Solicitantes, Cantidad),
    CostoDividido is Costo / Cantidad.

% Calcular costo total para una persona
costo_persona(Persona, Solicitantes, CostoTotal) :-
    tramos(Persona, TramosPersona),
    sumar_costos(TramosPersona, Solicitantes, 0, CostoTotal).

% Sumar costos de todos los tramos de una persona  % Acumula el costo de cada tramo dividido entre los solicitantes
sumar_costos([], _, CostoAcum, CostoAcum).
sumar_costos([Tramo|Resto], Solicitantes, CostoAcum, CostoTotal) :- % tramo es una lista de dos localidades [Origen, Destino]
    costo_dividido(Tramo, Solicitantes, CostoTramo),
    NuevoAcum is CostoAcum + CostoTramo,
    sumar_costos(Resto, Solicitantes, NuevoAcum, CostoTotal).  % % Llama recursivamente para el resto de los tramos, acumulando el costo.
    % El caso recursivo toma un tramo, calcula su coste parcial, lo suma al acumulador y recurre sobre la lista restante.

% Predicado principal
repartir_costos(Solicitantes, Resultados) :-
    findall([Persona, Camino, Costo],  % Encuentra todos los solicitantes, sus caminos y costos % Con findall construye una lista de triples [Persona, Camino, Costo] que devuelve en Resultados.
            (miembro(Persona, Solicitantes),
             camino(Persona, Camino),
             costo_persona(Persona, Solicitantes, Costo)),
            Resultados).