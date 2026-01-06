#|
12) Defina un procedimiento subst que reciba tres parámetros (dos valores y una lista) y devuelva la
 lista con todos los componentes que son iguales al primer parámetro reemplazados por el valor del
 segundo parámetro.
 Ej:(subst 'c 'k '( c o c o n u t))→(k o k o n u t)
|#

#|
(define (subst val rem L)
  (if (empty? L)
      '()
      let ([pr (car L)]) (
                          (if (= pr val)
                              ;
                              )) ))

  )
|#

(define (subst x y l)(if (null? l)
                         '() ;  puede ser la misma lista l al estar vacia
                         (if (eq? x (car l))
                             (cons y (subst x y (cdr l)))
                             (cons (car l) (subst x y (cdr l)))
                             )
                         )
  )
                             


(subst 'c 'k '( c o c o n u t)) 







