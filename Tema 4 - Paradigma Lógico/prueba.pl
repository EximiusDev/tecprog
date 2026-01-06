
/*
swipl ejerc1.pl

cada vez que se actualiza el archivo, se tiene que volver a cargar usando [nombre_archivo].

Poner punto y coma [;] al final de cada consulta o el tab


swipl 
[ejerc2].
*/


% Cuerpo de Conocimiento

f(a, 2).
f(a, 3).
f(b, 2).
f(b, 4).
f(c, 1).
f(c, 2).
/*
Consultas
a) f(X, 1) -> c
b) f(X). -> 
c) f(a, X).
d) f(c, 1). -> true
e) f(X, Y). -> a, 2; a, 3 ; b, 2 ; b, 4 ; c, 1 ; c, 2 % todos los pares
f) f(2, a). -> false
g) f(X, Y), f(X, 4). -> 


Instrucciones
1. Lea atentamente cada consulta y trate de predecir el resultado basándose en el cuerpo de
conocimiento
2. Ejecute las consultas en un entorno de Prolog para verificar sus respuestas.
3. Compare sus predicciones con los resultados obtenidos y explique cualquier discrepancia.

*/
