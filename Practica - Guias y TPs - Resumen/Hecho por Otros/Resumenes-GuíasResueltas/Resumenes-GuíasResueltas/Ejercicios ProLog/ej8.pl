hombre('juan').
mujer('maria').
hombre('mario').
mujer('romina').
hombre('luis').
mujer('eliana').
hombre('nahuel').
mujer('paulina').
hombre('bruno').
hombre('gaston').
hombre('1').
hombre('2').
hombre('3').
mujer('4').
mujer('5').
progenitor('juan','romina').
progenitor('maria','romina').
progenitor('juan','luis').
progenitor('maria','luis').
progenitor('mario','nahuel').
progenitor('mario','paulina').
progenitor('romina','nahuel').
progenitor('romina','paulina').
progenitor('luis','gaston').
progenitor('eliana','gaston').
progenitor('paulina','1').
progenitor('paulina','2').
progenitor('paulina','3').
progenitor('paulina','4').
progenitor('paulina','5').
progenitor('bruno','1').
progenitor('bruno','2').
progenitor('bruno','3').
progenitor('bruno','4').
progenitor('bruno','5').
padre(X,Y):- hombre(X), progenitor(X,Y).
madre(X,Y):- mujer(X), progenitor(X,Y).
abuelo(X,Z):- progenitor(Y,Z), progenitor(X,Y), hombre(X).
abuela(X,Z):- progenitor(Y,Z), progenitor(X,Y), mujer(X).
hermano(X,Y):- progenitor(Z,X), progenitor(Z,Y),  X\=Y.
hermano_x(X,Y):- hermano(X,Y), hombre(Y).
hermano_y(X,Y):- hermano(X,Y), mujer(Y).
sucesor(X,Y):- progenitor(X,Y).
sucesor(X,Y):- progenitor(X,Z),sucesor(Z,Y).


