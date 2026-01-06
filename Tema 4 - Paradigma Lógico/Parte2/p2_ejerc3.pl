% [p2_ejerc3].

/*
A los abogados les gustan las novelas largas.
● Tanto a los ingenieros como a los médicos les gustan las novelas.
● A las mujeres les gustan todos los libros largos.
● A los contadores varones les gustan tanto los libros de cuentos como los libros de poemas.
● Haydée es una mujer que es abogada y también ingeniera.
● Tania es una mujer médica.
● Livio es un varón contador a quien le gusta "Rayuela".
● Pedro es un abogado varón a quien le gustan los libros de cuentos.
● "Rayuela" y "Karamazov" son novelas largas.
● "Octaedro" es un libro de cuentos corto.
● "Inventario" es un libro de poemas largo.
● "Leones" es una novela corta.
*/
% Hechos;

%profesiones;
abogado(haydee).
abogado(pedro).

ingeniero(haydee).
medico(tania).
contador(livio).

mujer(tania).
varon(livio).
varon(pedro).

libro('Rayuela', novela, largo).
libro('Karamazov', novela, largo).
libro('Octaedro', cuentos, corto).
libro('Inventario', poemas, largo).
libro('Leones', novela, corto).

libro('tecprog', terror, largisimo).
/*
novela_larga(rayuela).
novela_larga(karamazov).
libro_cuento(octaedro).
libro_poema(inventario).
novela_corta(leones).
*/

gustos(livio, 'Rayuela').

gustos(Per, Lib) :-  abogado(Per), 
                      libro(Lib, novela, largo). % A los abogados les gustan las novelas largas.  
/*
gustos(Per, Lib) :-  abogado(Per), 
                      libro( _, novela, largo).
*/
gustos(Per, Lib) :- contador(Per), 
                      libro(Lib, cuentos, corto). % A los contadores varones les gustan los libros de cuentos cortos.

gustos(Per, Lib) :- contador(Per),
                        libro(Lib, poemas, _). % A los contadores varones les gustan los libros de poemas largos.

gustos(Per, Lib) :- ingeniero(Per), 
                      libro(Lib, novela, _). % Tanto a los ingenieros como a los médicos les gustan las novelas.

gustos(Per, Lib) :- medico(Per), 
                      libro(Lib, novela, _). % Tanto a los ingenieros como a los médicos les gustan las novelas.

gustos(Per, Lib) :- mujer(Per),
                        libro(Lib, _, largo). % A las mujeres les gustan todos los libros largos.

gustos(pedro, Lib) :- %abogado(pedro),
                      libro(Lib, cuentos, _). % A Pedro le gustan los libros de cuentos.  


% Reglas;


/*
Consultas
a) ¿Qué libros le gustan a Livio?   % ?- gustos(livio, Libro).
b) ¿A quiénes les gusta "Leones"?   % ?- gustos(Persona, 'Leones').
c) ¿Qué libros cortos tiene registrado el programa? % ?- libro(Lib, _, corto).


Agregar al programa la posibilidad de responder consultas acerca de qué libros son valiosos. Se
considera que un libro es valioso si le gusta a, al menos, dos personas distintas.
*/

%?- Y = cuentos, libro(Z, Y ,_ ), gustos(X, Z ). 

valioso(Lib) :- gustos(X, Lib),
                gustos(Y, Lib),
                X \= Y.

/*
?- valioso('tecprog').  
?- valioso('Rayuela').
*/


