% comentario de una lineas

% swipl prueba.pl
% [ejerc1].

/*
 swipl ejerc1.pl

cada vez que se actualiza el archivo, se tiene que volver a cargar usando [nombre_archivo].

 Poner punto y coma [;] al final de cada consulta o el tab
*/

% Cuerpo de Conocimiento: define reglas, (cosas que son verdaderas) [hechos]

f(a, 2).
f(a, 3).
f(b, 2).
f(b, 4).
f(c, 1).
f(c, 2).
/*
Consultas
a) f(X, 1) -> c
b) f(X). -> ERROR (tiene que ser f(X, Y) o 2 argumentos)
c) f(a, X). -> 2; 3
d) f(c, 1). -> true
e) f(X, Y). -> a, 2; a, 3 ; b, 2 ; b, 4 ; c, 1 ; c, 2 % todos los pares
f) f(2, a). -> false
g) f(X, Y), f(X, 4). ->  b, 2 ; b, 4 ; false    % la "," cuenta como un "and" 
    -> f(X, Y). -> todos los valores y un "and" con "b"

Instrucciones
1. Lea atentamente cada consulta y trate de predecir el resultado basándose en el cuerpo de
conocimiento
2. Ejecute las consultas en un entorno de Prolog para verificar sus respuestas.
3. Compare sus predicciones con los resultados obtenidos y explique cualquier discrepancia.



Poner punto y coma [;] al final de cada consulta o el tab
*/
