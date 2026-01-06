#lang racket/base
;(display "Hello, World!")

;se ejecuta de izquierda a derecha

"hola"
42
22/7
3.141592653
+
(+ 76 31)
'(a b c d)



;;;;;;;;;;;;;;;;;;;;;;;;


;cdr: accedo a la cola de la la lista, lo devuelve en forma de lista
;car: devuelve el 1er elemento de una lista, en forma de valor

;;;;;;;;;;;;;;;;;;;;;;;;

;definir un procedimiento:
  
(define cuadrado 
    (lambda (n) 
          (* n n)
                ) )
  
  
 (cuadrado 4)
 
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
 ;cons: no es concatenar, se le pasan 2 elementos, mete un elemento en una lista (se le pasa una lista y un elemento) 
    ;devuvelve una lista con los elementos pasados (idealmente se le pasa un elemento y una lista)

; lista propia: (a b c) ---> tiene una lista vacia al final
; lista impropia: (a. b) ---> no tiene una lista vacia al final, solo tiene 2 valores


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(let ((x 2) (y 4))  (+ x y) )   ; cabecera: (x 2) (y 4) , cuerpo: (+ x y) 
