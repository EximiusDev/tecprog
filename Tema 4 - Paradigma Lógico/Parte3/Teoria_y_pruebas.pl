/*
Parte III 
Introducción 
En esta guía, exploraremos conceptos avanzados de la programación lógica utilizando Prolog. Los 
ejercicios se centran en el uso de listas, recursión, árboles binarios y operaciones comunes en 
estructuras de datos. Cada ejercicio está diseñado para profundizar en la lógica y la manipulación de 
datos en Prolog, ofreciendo una comprensión más sólida de cómo resolver problemas complejos de 
manera lógica. 
*/

/*
Ejercicio 1: Calcular el Factorial de un Número 
Cree un programa en Prolog que permita calcular el factorial de un número con el predicado 
factorial/2, validando que dicho número sea mayor o igual a cero
*/

/*
Ejemplo 
?- factorial(5, Factorial). 
Factorial = 120. 
*/

/*
Instrucciones 
1. Defina el predicado factorial/2. 
2. Asegúrese de validar que el número sea mayor o igual a cero. 
3. Implemente la lógica para calcular el factorial de un número. 
*/
/*
factorial(X,Y) :- 
    X >= 0.
*/
%factorial(0). -> 1 % Caso base: el factorial de 0 es 1.
factorial(N, F) :- 
    N > 0, 
    N1 is N - 1, 
    factorial(N1, F1), 
    F is N * F1. % Caso recursivo: el factorial de N es N por el factorial de N-1.

    MALLLLLLLL