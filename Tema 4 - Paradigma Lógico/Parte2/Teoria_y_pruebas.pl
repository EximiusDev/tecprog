/*
Parte II 
Introducción 
En esta segunda parte de la guía, se profundizará en la creación y consulta de cuerpos de 
conocimiento más complejos utilizando Prolog. Los ejercicios presentados están diseñados para 
desafiar a los estudiantes a pensar lógicamente y a construir programas que modelen situaciones del 
mundo real. 
*/

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
    postre(Postre).

/*
carta('ensalada', 'lomo a la pimienta', 'flan').
carta('ensalada', 'pollo al horno', 'helado').
carta('sopa de verduras', 'pescado al horno', 'tarta de manzana').
*/

