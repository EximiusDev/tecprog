% [p3ejerc6].

/*
Ejercicio 6: Sumar Elemento a Elemento de Dos Listas
Escriba un programa en Prolog que reciba dos listas de números, verifique que sean de la misma
longitud, y luego retorne una lista con la suma elemento a elemento de ambas listas

Ejemplo
?- suma_lista([1, -2, 3, -4], [2, 3, 1, 4], ListaSuma).
ListaSuma = [3, 1, 4, 0].

Instrucciones
1. Defina el predicado suma_lista/3.
2. Implemente la lógica para sumar elemento a elemento de dos listas de la misma longitud
*/


suma_lista([], [], []).

suma_lista([], L, _):-
                    L \= [], !,fail.   % SINO HAY QUE CONTAR LA CANTIDAD DE ELEMENTOS DE AMBAS LISTAS Y COMPARAR (usando p3ejerc3)
suma_lista(L, [], _):-
                    L \= [], !,fail.   % CONDICION DE CORTE POR FALSO (PARTE 4)
                    
suma_lista([X|Y], [A|B], [SUM|ColaSum]):-
                            suma_lista(Y, B, ColaSum),
                            SUM is X + A.


/*
cantidad([], 0) :- !.
cantidad([_|T], Cant) :- cantidad(T,Cant1) , Cant is Cant1 + 1.
suma_lista([],[],[]).
suma_lista([X|Cola1], [Y|Cola2], [Acumulador|Pos]) :-
    cantidad(Cola1,Cant1),
    cantidad(Cola2,Cant2),
    Cant1==Cant2,
    Acumulador is X + Y,
    suma_lista(Cola1,Cola2,Pos).
*/



/*
suma_lista([X|Y], [A|B], [X + A|ColaSum]):-
                            %SUM is X + A
                            suma_lista(Y, B, ColaSum).
*/

                        