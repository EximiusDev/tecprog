libro('Rayuela',novela,largo).
libro('Karamazov',novela,largo).
libro('Octaedro',cuento,corto).
libro('Inventario',poema,largo).
libro('Leones',novela,corta).

abogado(haydee).
abogado(pedro).
ingeniero(haydee).
medico(tania).
contador(livio).

mujer(haydee).
mujer(tania).
varon(livio).
varon(pedro).

gusta(X,Y):- abogado(X),libro(Y,novela,largo).
gusta(X,Y):- (ingeniero(X);medico(X)),libro(Y,novela,_).
gusta(X,Y):- mujer(X),libro(Y,Z,largo).
gusta(X,Y):- contador(X),varon(X),(libro(Y,cuento,_);libro(Y,poema,_)).

gusta(livio,'Rayuela')
gusta(pedro,Y):- libro(_,cuento_).



