#|
 7) Elprocedimientolengthretornalalongituddesuargumento,quedebeserunalista.Porejemplo,
 (length'(abc))es3.Usandolength,definaelprocedimientomascorta,queretornalalista
 máscortadelosdosargumentospasadosolaprimeralistasi tienenelmismolargo.
|#

(define (mascorta L1 L2)
   (if  (<= (length L1) (length L2))
        L1
        L2)
  )

(mascorta'(a b)'(c d e))

 (mascorta'(a b)'(c d))

 (mascorta'(a b)'(c))
