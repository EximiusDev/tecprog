% [p2_ej2].

% Cuerpo de conocimiento
% Hechos

% hombre/1: determina que su argumento es una persona de sexo masculino
hombre('Mateo').
hombre('Santiago').
hombre('Tomas').
hombre('Joaquin').
hombre('Benjamin').
hombre('Nicolas').
hombre('Lautaro').
hombre('Bruno').

% mujer/1: determina que su argumento es una persona de sexo femenino.
mujer('Ana').
mujer('Camila').
mujer('Lucia').
mujer('Valentina').
mujer('Sofia').
mujer('Julieta').
mujer('Martina').

% progenitor/2: determina que el primer argumento es progenitor (madre o padre) del segundo.
progenitor('Mateo', 'Benjamin').
progenitor('Ana', 'Benjamin').

progenitor('Santiago', 'Sofia').
progenitor('Camila', 'Sofia').

progenitor('Tomas', 'Nicolas').
progenitor('Lucia', 'Nicolas').

progenitor('Joaquin', 'Julieta').
progenitor('Valentina', 'Julieta').

progenitor('Benjamin', 'Martina').
progenitor('Sofia', 'Martina').

progenitor('Nicolas', 'Lautaro').
progenitor('Julieta', 'Lautaro').

progenitor('Martina', 'Bruno').
progenitor('Lautaro', 'Bruno').

padre(X,Y) :- progenitor(X,Y), hombre(X).
madre(X,Y) :- progenitor(X,Y), mujer(X).
abuelo(X,Y) :- progenitor(X,Z), progenitor(Z,Y), hombre(X).
abuela(X,Y) :- progenitor(X,Z), progenitor(Z,Y), mujer(X).
hermanos(X,Y) :- X\=Y, progenitor(Z,X), progenitor(Z,Y).
hermano(X,Y) :- hombre(X), hermanos(X,Y).
hermana(X,Y) :- mujer(X), hermanos(X,Y).
sucesor(X,Y) :- progenitor(Y,X).
sucesor(X,Y) :- progenitor(Y,Z), sucesor(X,Z).

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