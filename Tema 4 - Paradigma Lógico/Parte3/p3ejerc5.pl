% [p3ejerc5].

/*
Ejercicio 5: Filtrar Números Positivos
Escriba un programa en Prolog que, dada una lista de números enteros, retorne otra lista solo con los
números positivos de la misma.
Ejemplo
?- positivos([1, -2, 3, -4], ListaPositivos).
ListaPositivos = [1, 3].
Instrucciones
1. Defina el predicado positivos/2.
2. Implemente la lógica para filtrar los números positivos de una lista.

*/

positivos([], []).
positivos([X|Y], [X|ListaPositivos]):-
                        X >= 0,
                        positivos(Y, ListaPositivos).

positivos([X|Y], ListaPositivos):-
                        X < 0,
                        positivos(Y, ListaPositivos).


/*
positivos([], []).

positivos([X | Cola], Resultado) :-
    (X > 0 -> Resultado = [X | R] ; Resultado = R),
    positivos(Cola, R).

*/