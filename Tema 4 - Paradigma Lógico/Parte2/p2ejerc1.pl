
% [p2ejerc1].
/*
Ejercicio 1: Menú del Restaurante 
Escriba un programa en Prolog que represente el cuerpo de conocimiento con los distintos platos de 
un restaurante: entrada, plato principal y postre. Cree el cuerpo de conocimiento con tres ejemplos de 
cada uno. Por último, cree un predicado carta/3 que como resultado combine todos los posibles 
platos, en donde el primer argumento corresponda a las entradas, el segundo a los platos principales 
y el tercero a los postres. ¿Cuántos resultados debería retornar? 

Ejemplo

?- carta(X, Y, Z). 
X = ensalada, Y = lomo a la pimienta, Z = flan; 
...

Instrucciones 
1. Defina tres predicados separados para las entradas, platos principales y postres. 
2. Agregue tres ejemplos de cada tipo de plato. 
3. Cree un predicado carta/3 que combine todas las entradas, platos principales y postres. 
4. Realice una consulta para carta/3 y verifique que se generen todas las combinaciones 
posibles. 
*/
% carta/3 : tiene tres argumentos, que representan la entrada, el plato principal y el postre.



% 1. predicados separados para (entrada, plato_principal , postre))
% Entradas
entrada('ensalada').
entrada('sopa de verduras').
entrada('tarta de atún').
% Platos principales
plato_principal('lomo a la pimienta').
plato_principal('pollo al horno').
plato_principal('pescado al horno').
% Postres
postre('flan').
postre('helado').
postre('tarta de manzana').

% 2. Agregue tres ejemplos de cada tipo de plato (ya están agregados arriba)
% 3. Cree un predicado carta/3 que combine todas las entradas, platos principales y postres.

carta(Entrada, PlatoPrincipal, Postre) :-
    entrada(Entrada),
    plato_principal(PlatoPrincipal),
    postre(Postre).                                 % se usa "," para indicar que todos los predicados deben ser verdaderos


/*
carta(Entrada, PlatoPrincipal, Postre) :-
    entrada(Entrada),
    plato_principal(PlatoPrincipal),
    postre(Postre),                                 % se usa "," para indicar que todos los predicados deben ser verdaderos
    write('Entrada: '), write(Entrada), nl, % escribe la entrada
    write('Plato Principal: '), write(PlatoPrincipal), nl,
    write('Postre: '), write(Postre), nl,
    %write(Entrada, ' - ', PlatoPrincipal, ' - ', Postre), nl, % escribe la entrada, plato principal y postre
    fail.% fail para que Prolog siga buscando todas las combinaciones posibles
% Nota: El uso de "fail" es para forzar a Prolog a buscar todas las combinaciones posibles.
*/
/*
carta('ensalada', 'lomo a la pimienta', 'flan').
carta('ensalada', 'pollo al horno', 'helado').
carta('sopa de verduras', 'pescado al horno', 'tarta de manzana').
*/

% 4.
% ?- carta(X, Y, Z). 

% 4.
% ?- carta(Entrada, PlatoPrincipal, Postre). 