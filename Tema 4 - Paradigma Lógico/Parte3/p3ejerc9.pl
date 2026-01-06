
% [p3ejerc9].

/*
Ejercicio 9: Insertar Elemento en una Lista Ordenada
Escriba un programa en Prolog que, dada una lista numérica ordenada, inserte un elemento en el
lugar correspondiente según el orden.

Ejemplo
?- insertar(3, [1, 2, 4, 5], Resultado).
Resultado = [1, 2, 3, 4, 5].

Instrucciones:
1. Defina el predicado insertar/3.
2. Implemente la lógica para insertar un elemento en una lista ordenada.

*/

insertar(X, [], [X]).
insertar(X, [Cab|Col], [Cab|Resultado]):-
    Cab < X,
    insertar(X, Col, Resultado).
insertar(X, [Cab|Col], [X,Cab|Col]):-
    Cab >= X.





