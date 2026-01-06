% swipl ejerc2.pl
% [ejerc2].

%cada vez que se actualiza el archivo, se tiene que volver a cargar usando [nombre_archivo].

/*
Ejercicio 2: Creación y Consulta de un Cuerpo de Conocimiento en Prolog
Escriba como programa en Prolog el siguiente cuerpo de conocimientos:
● Leoncio es padre de Alberto y de Gerónimo.
● Alberto es padre de Juan y de Luis.
● Gerónimo es padre de Luisa.
● A es hermano de B si A y B tienen un padre en común y son distintas personas.
● A es nieto de B si el padre de A es hijo de B.

*/

% Cuerpo de Conocimiento (Hechos)  
padre(leoncio, alberto).
padre(leoncio, geronimo).
padre(alberto, juan).
padre(alberto, luis).
padre(geronimo, luisa).

/*
padre es una relación binaria que indica que el primer argumento es padre del segundo.
*/

% Reglas   

% A es hermano de B SI A y B tienen un padre en común y son distintas personas.
% SI A y B tienen un padre en común, ENTONCES A es hermano de B.

hermano(A, B) :- padre(P, A), padre(P, B), A \= B.           % '\=' significa "distinto de"
nieto(A, B) :- padre(P, A), padre(B, P).    % nieto: indica que A es nieto de B si el padre de A es hijo de B.   
% abuelo(A, B) :- padre(A, P), padre(P, B).



% Consultas         
/*
a) ¿Cómo consultaría si Alberto es padre de Luis? -> padre(alberto, luis).
b) ¿Cómo consultaría si Luis es padre de Alberto? -> padre(luis, alberto).
c) ¿Cómo consultaría quién es hermano de Luis? -> hermano(X, luis). -> X = juan.
d) ¿Cómo consultaría de quién es nieto Luisa?  -> nieto(luisa, X). -> X = leoncio.
e) ¿Cómo consultaría quién es nieto de quién? -> nieto(X, Y). -> X = leoncio, Y = juan ; X = leoncio, Y = luis ; X = leoncio, Y = luisa ; false.

Instrucciones
1. Escriba el cuerpo de conocimiento en un archivo Prolog.  
2. Ejecute las consultas en un entorno de Prolog para verificar sus respuestas.
3. Compare sus predicciones con los resultados obtenidos y explique cualquier discrepancia.

*/

% Consultas
% % Símbolos de Predicado: son consulta, donde se evaluan todos los argumentos, 
% dan verdadero o falso 

% Símbolos de Función (Functores): son consulta, donde ponemos variables en los argumentos,
% se puede evalua uno o varios argumentos , pero no todos (no da v o f),
% dan como resultado un valor o una lista de valores, es decir devuelve otro objeto,
%  (crea un término complejo que representa un objeto)


% los Functores y Símbolos de Predicado no son los hechos ni las reglas


% las formulas atomicas no son objetos