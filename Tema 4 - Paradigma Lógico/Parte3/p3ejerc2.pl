% [p3ejerc2].

/*
Ejercicio 2: Contar Apariciones en una Lista
Cree un programa en Prolog que cuente la cantidad de veces que aparece un elemento en una lista.
Ejemplos
?- contar(y, [a, b, c, a, d, e, a, f, a], Cantidad).
Cantidad = 0.
?- contar(a, [a, b, c, a, d, e, a, f, a], Cantidad).
Cantidad = 4.
Instrucciones
1. Defina el predicado contar/3.
2. Implemente la lógica para contar las apariciones dde un elemento en una lista.

*/

contar(_ , [] , 0).
contar(Y , [Car0|Cdr0] , Cant) :-
                        Y == Car0,
                        contar(Y , Cdr0 , Cant1),
                        Cant is Cant1 + 1.

contar(Y , [Car0|Cdr0] , Cant) :-
                        Y \= Car0,   % no es necesario porque ya evaluo la igualdad
                        contar(Y , Cdr0 , Cant).

% ?- contar(y, [a, b, c, a, d, e, a, f, a], Cantidad)
% ?- contar(a, [a, b, c, a, d, e, a, f, a], Cantidad).
/*
contar(_,[], 0).
contar(Num, [X|T], Cant) :- Num==X ,contar(Num, T, Cant1), Cant is Cant1 + 1.
contar(Num, [X|T], Cant) :- Num \= X, contar(Num, T, Cant).
*/