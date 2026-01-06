% [p3ejerc3].

/*
Ejercicio 3: Contar Elementos de una Lista
Escriba un programa en Prolog que reciba como primer parámetro una lista de números y unifique el
segundo con la cantidad de elementos de dicha lista.

Ejemplo
?- cantidad([a, b, c], Elementos).
Elementos = 3.

Instrucciones
1. Defina el predicado cantidad/2.
2. Implemente la lógica para contar los elementos de una lista.
*/

cantidad([], 0).
cantidad([_|L], Cuenta):-
                    cantidad(L, Cuenta1),
                    Cuenta is Cuenta1 + 1.

% cantidad([a, b, c], Elementos).