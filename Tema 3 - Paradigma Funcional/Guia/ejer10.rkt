#|
   10)Escribaunafunciónlargoquedevuelvael largodeunalistasinutilizar lafuncióndefinidaen
 Racket.
 Ej:(largo'(1 4 8))→3
|#

(define (largo l)
  (if (empty? l)
      0
      (+ 1 (largo(cdr l)) ))
  
  )

(largo '(1 4 8))

