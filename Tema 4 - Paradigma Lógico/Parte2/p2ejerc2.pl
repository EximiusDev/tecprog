% [p2ejerc2].

/*
Ejercicio 2: Árbol Genealógico 
Con los siguientes predicados, cree un árbol genealógico correcto con al menos 4 niveles y 15 
miembros: 
● progenitor/2: determina que el primer argumento es progenitor (madre o padre) del segundo. 
● hombre/1: determina que su argumento es una persona de sexo masculino. 
● mujer/1: determina que su argumento es una persona de sexo femenino. 
*/

progenitor(X,Y).
hombre(X).
mujer(X).

/*
Cree las siguientes reglas: 
a) El padre de una persona es su progenitor masculino. 
b) La madre de una persona es su progenitor femenino. 
c) El abuelo de una persona es el padre del padre o el padre de la madre de dicha persona. 
d) La abuela de una persona es la madre del padre o la madre de la madre de dicha persona. 
e) Un hermano de una persona es cualquier persona con los mismos padres y que sea distinto 
de la persona en cuestión. 
f) 
Un hermano varón de una persona es cualquier persona varón con los mismos padres y que 
sea distinto de la persona en cuestión. 
g) Una hermana mujer de una persona es cualquier persona mujer con los mismos padres y 
que sea distinta de la persona en cuestión. 
h) Un sucesor de una persona es cualquier persona que descienda de ésta.
*/

padre(X,Y) :- progenitor(X,Y), hombre(X).   % a.
madre(X,Y) :- progenitor(X,Y), mujer(X).    % b.
abuelo(X,Y) :- progenitor(Z,Y), padre(X,Z). % c.
abuela(X,Y) :- madre(X,Z), progenitor(Z,Y). % d. Una abuela es la madre de un progenitor de Y, o sea, la madre del padre o la madre de la madre de Y.
hermano(X,Y) :- progenitor(P,X), progenitor(P,Y), X \= Y. % e. \= significa "distinto de"
hermano_varon(X,Y) :- hermano(X,Y), hombre(X). % f.
hermana_mujer(X,Y) :- hermano(X,Y), mujer(X).  % g.
sucesor(X,Y) :- progenitor(Y,X).
%sucesor(X,Y) :- progenitor(Y,X), !.         % h. Un sucesor es cualquier persona que descienda de X, es decir, que sea su hijo o hija.
%sucesor(X,Y) :- progenitor(Z,X), sucesor(Z,Y). % Un sucesor también puede ser un nieto, bisnieto, etc. Se busca recursivamente.
/*
Cree las siguientes reglas interpretando la lógica a utilizar: 
a) es_madre/1: su argumento es madre. 
b) es_padre/1: su argumento es padre. 
c) tia/2: su primer argumento es tía del segundo argumento. 
d) yerno/2: su primer argumento es yerno de su segundo argumento. 
e) nuera/2: su primer argumento es nuera de su segundo argumento. 
*/

es_madre(X) :- madre(X,_).  % a. Una persona es madre si tiene al menos un hijo.
es_padre(X) :- padre(X,_).  % b. Una persona es padre si tiene al menos un hijo.

/*
Instrucciones 
1. Defina los predicados hombre/1, mujer/1 y progenitor/2 para cada miembro del árbol 
genealógico. 
2. Utilice los predicados básicos para definir las reglas más complejas, como padre/2, madre/2, 
abuelo/2, etc. 
3. Asegúrese de que las reglas para hermano/2, hermano_varon/2 y hermana_mujer/2 
considerar que los hermanos deben ser diferentes entre sí. 
4. Realice consultas para verificar que las relaciones genealógicas se hayan definido 
correctamente.
*/

% Cuerpo de Conocimiento (Hechos)
hombre(leoncio).
hombre(alberto).
mujer(maria).
progenitor(leoncio, alberto).
progenitor(alberto, maria).