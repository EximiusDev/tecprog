% [prueba].

/*


*/
miembro(X, [X|_]).
miembro(X, [_|R]) :- miembro(X, R).
