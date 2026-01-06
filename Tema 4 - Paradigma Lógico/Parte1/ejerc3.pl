% [ejerc3].
/*
Ejercicio 3: Declaración y Consulta de Menús en Prolog
Dada la lista de platos de un restaurante, 
confeccione los predicados necesarios para declarar los menús,
 y luego realice las siguientes consultas:
*/

% Cuerpo de Conocimiento (Hechos)
% Menús Existentes
menu('Bombones de jamon', 'Locro', 'Dulce de batata').
menu('Bombones de jamon', 'Locro', 'Alfajor norteño').
menu('Tarta de Atun', 'Atados de repollo', 'Dulce de batata').
menu('Tarta de Atun', 'Pollo romano con hierbas y vino', 'Flan').
menu('Volovanes de atun', 'Matambre con espinacas y parmesano', 'Torta moka').
menu('Buñuelos de bacalao', 'Pollo romano con hierbas y vino', 'Alfajor norteño').

% para las consultas si los hechos si tiene "[]", las consultas tambien tienen "[]"

/*
Consultas
a) Listado completo de posibles menús que se ofrecen.       -> menu(Entrada, Plato_principal, Postre). 
% menu(X,Y,Z). 
b) ¿En qué menú está incluido el postre 'Dulce de batata'?  -> menu(X,Y,'Dulce de batata').
c) ¿En qué menú está incluido el plato principal 'Locro'?   -> menu(X,'Locro',Y).
d) ¿Hay algún menú que contenga como plato principal 'Pato a la naranja'? ->
e) ¿Hay algún menú que contenga 'Locro' como entrada?

Instrucciones
1. Escriba los predicados necesarios para declarar los menús en un archivo Prolog.
2. Ejecute las consultas en un entorno de Prolog para verificar sus respuestas.
3. Compare sus predicciones con los resultados obtenidos y explique cualquier discrepancia.

*/

