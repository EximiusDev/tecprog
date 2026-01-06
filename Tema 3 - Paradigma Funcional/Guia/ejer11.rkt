#|
   11) Escriba una función que cuente la cantidad de apariciones de un elemento en una lista. El primer
 parámetro será el elemento a buscar y el segundo la lista en la que se debe buscar.
 Ej: (count-elem 3 '(1 2 3 4 5 4 3 2 1 )) →2
|#


(define (count-elem E L)
  (if (empty? L)
      0
      (if ( not (eqv? (car L) E))
          (+ 0 (count-elem E (cdr L)) )
          (+ 1 (count-elem E (cdr L)) ))
      )
  )


(count-elem 3 '(1 2 3 4 5 4 3 2 1))