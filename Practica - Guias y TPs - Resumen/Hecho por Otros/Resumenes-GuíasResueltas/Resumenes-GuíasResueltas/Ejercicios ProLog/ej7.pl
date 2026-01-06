entrada('salame y queso').
entrada('ensalada').
entrada('empanadas').
plato('asado').
plato('pollo').
plato('pastas').
postre('helado').
postre('flan').
postre('torta').
carta(X,Y,Z):- entrada(X), plato(Y), postre(Z).
