 '(+ 2 3 4)
;(* (- x 2) y)

#(esto es un vector de símbolos)


list'(1 2 3)


(list 1 4 5)


(list 1 (list '“two” '“three”) 4 5)


 (quote (1 ("two" "three") 4 5))


 (cons 'a '()) ; ⇒ (a)
 (cons 1 'a) ; si a cons el 2do elemento no es una lista, te devuelve una lista impropia

 (cons '(a b) '(c d)) ;  (a b) es un elemento y se mete en la lista(c d)


(cdr '(1 a)) ; Lista propia

(cdr (list 1 'a)) ; Lista propia

(cdr (cons 1 'a)) ; Lista Impropia

(cdr '(1 . a)) ; Lista Impropia

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(let ((var1 1)) (+ 1 var1) )

(let ((var1 1)) (cdr (list 2 var1)))


(let ([x 10]) (let ([x 20]) (+ x 5)) x)

(let ([x 10]) (list (let ([x 20]) (+ x 5)) x))


(let ([x 10]) 1 x 15)

 (let ((a 4) (b -3))
                   (let (   (a-squared (* a a))
                            (b-squared (* b b)))
                                 (+ a-squared b-squared))) 


(define mensaje "Hola, mundo")
mensaje

 (define (sumar x y)
 (+ x y))

(sumar 2 3)

(let ([sumar 4]) sumar) ; shadowing

 ;(lambda (x) (* x x))

 ( (lambda (x) (* x x)) 5)


(define (valor-absoluto x)
  (if (< x 0)
     (- x) ; Si x es negativo, devuelve su negativo
      x))  ; Si x es positivo o cero, devuelve x


(valor-absoluto -2)


 (define (signo x) 
   (cond           ; case = cond
     [(< x 0) -1]  ; [(condicion) expresion]
     [(= x 0) 0]
     [else 1]))    ; [else expresion_por_defecto]

(signo -10)   ; retorna -1 por ser negativo

(let ([x (signo -5)]) x)

(not #f) 

(not 0) ; cualquier valor que no sea #f se considera verdadero.

(or) ; → #f(sin argumentos, se considera falso)
"hola"
(or #f #t) ; 
(or #f 'a) ; uno "o" el otro, al ser nada o "algo", devuelve ese "algo"
(or 1 2) ; devuelve el 1er valor porque solo necesita un valor verdadero
"hola"
 (and);-> #t
 (and #t 5) ; uno "y" el otro, al ser verdadero o "algo", devuelve ese "algo"
 (and 5 1 2)  ; devuelve el ultimo valor porque necesita todos los valores verdaderos

(= 5 '5)

 ; (filter)  Funciones de filtrado (filter) para seleccionar elementos de una lista que cumplan con una cierta condición.

; (sort) Funciones de ordenamiento (sort) para comparar elementos y determinar su orden

;  null? -> predicado
 (eqv? 'a 'a)

 (define (suma-lista lista1)
   (if (null? lista1)               ; ver si usar a Caso Base o Caso Recursivo
       0                            ; Caso base: la lista está vacía
; La suma de una lista vacía es 0
       (+ (car lista1)              ; Caso recursivo: sumar el 1er elemento y...
          (suma-lista (cdr lista1)))
              ))                    ; ...y la suma del resto de la lista

(suma-lista (list 1 2 3))

(let* ([x 10] [y (+  x 1)]) y)

(letrec ([x 10] [y (+  x 1)]) y)

(define (flitra-pares lista)
  (letrec                     
           ([es-par? (lambda (n)      ; uso una func anonima porque todavia no defini el valor
                      (if (= n 0)
                          #t
                          (es-impar? (sub1 n))))]  ; llamo a es-impar? desde la func es-par?
           [es-impar? (lambda (n)
                        (if (= n 0)
                            #f
                            (es-par? (sub1 n))))]) ; (sub1 n) -> sub1:hace n-1
    (filter es-par? lista)))    ; el 2do argumento es la cond que tiene que cumplir 



(flitra-pares (list 1 2 3 4)) ; flitra-pares


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(make-vector 5 'a)

 (vector-length #(a b c))

 (vector-ref #(a b c) 0)  ; devuelve el elem de la posicion


(let ((v (vector 'a 'b 'c 'd 'e)))
   (vector-set! v 2 'x) v)

;(vector-fill! vector obj ) 

(vector->list #(1 2 3))

(list->vector '(1 2 3))

;;;;;;;;;;;
; Mapeo de Procedimientos a Listas

; MAP: aplica el procedimiento a cada elemento de la lista y devuelve una lista con los resultados

(map (lambda (x) (+ x 2)) '(1 2 3)) ; suma 2 a c/elemento de la lista

; map con múltiples argumentos
 (map cons '(1 2 3) '(10 20 30))

(for-each display
  (list "un " "dos " "tres" "\n") )

(for-each display
   '(1 2 3 "\n"))

;;;;;;;;;;;;;;;;;;;;;;;;;;

; read-char

;read-line

(write-char #\h)

;write

;display

;open-input-file

;open-output-file

;  close-input-port / close-output-port