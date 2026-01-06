% [p3ejerc8].

/*
Ejercicio 8: Determinar la Profundidad de un Árbol Binario

Escriba un programa en Prolog que recorra un árbol binario y determine la profundidad del mismo. La
representación del árbol será una lista con el siguiente formato: [I, N, D].

Ejemplo
?- profundidad([[[c], b, [d]], a, [[], e, [f]]], Profundidad).
Profundidad = 3.

Instrucciones
1. Defina el predicado profundidad/2.
2. Implemente la lógica para determinar la profundidad de un árbol binario representado como
listas.

*/

% [I, N, D].
/*

[[[c], b, [d]], a, [[], e, [f]]]
          a   [[izq],  a , [der] ]   ->  [[. b .],  a , [. e .] ]
        /   \      [[c],  b , [d] ]
       b     e      [[1],  e , [f] ]
      / \   / \         [ c ]  [ d ]
     c   d 1   f            [ 1 ]    [ f ]  

*/

profundidad([], 0).
profundidad([Nod], 1).
profundidad([Izq, Nod, Der], Prof):-
    profundidad(Der, ProfDer),
    profundidad(Izq, ProfIzq),
    ProfDer >= ProfIzq,
    Prof is ProfDer + 1. % max(Prof_der, Prof_Cola, Profundidad).

profundidad([Izq, Nod, Der], Prof):-
    profundidad(Der, ProfDer),
    profundidad(Izq, ProfIzq),
    ProfIzq > ProfDer,
    Prof is ProfIzq + 1.

/*
profundidad([], 0).
profundidad([Der|Cola], Profundidad):-
    profundidad(Der, Prof_der),
    profundidad(Cola, Prof_Cola),
    Prof_der is Profundidad + 1,
    Prof_Cola is Profundidad + 1,
    (Prof_der >= Prof_Cola -> Profundidad is Prof_der ; Profundidad is Prof_Cola). % max(Prof_der, Prof_Cola, Profundidad).
    */