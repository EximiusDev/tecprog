#| -------------------------------------------------------------------- |#
                             #| Datos |#
#| -------------------------------------------------------------------- |#
#lang racket

(define localidades         ; definimos las localidades
  '("Córdoba Capital"
    "Carlos Paz"
    "Bialet Massé"
    "Valle Hermoso"
    "La Falda"
    "Huerta Grande"
    "La Cumbre"
    "Capilla Del Monte")) 
 
(define costos
  '(1500 1500 1000 1200 1000 1200 1600))

(define horarios         ; definimos los horarios para c/viaje (depende de la localidad)
  '(((07 00) (10 00) (12 00))      ; Córdoba Capital
    ((07 30) (10 30) (12 30))      ; Carlos Paz
    ((07 45) (10 45) (12 45))      ; Bialet Massé
    ((08 15) (11 15) (13 15))      ; Valle Hermoso
    ((08 30) (11 30) (13 30))      ; La Falda
    ((08 45) (11 45) (13 45))      ; Huerta Grande
    ((09 30) (12 30) (14 30))      ; La Cumbre
    ((10 00) (13 00) (15 00))))    ; Capilla Del Monte

#| -------------------------------------------------------------------- |#
                     #| Funciones Auxiliares |#
#| -------------------------------------------------------------------- |#

#| Retorna los primeros n elementos de la lista l |#            ; no se esta cambiando el estado de la lista, sino que se crea una nueva lista
(define (take l n)
  (if (or (zero? n) (null? l))
      '()
      (cons (car l) (take (cdr l) (- n 1)))))      ; hace una lista poniendo los elementos de l con cons (hasta n == 0 or l vacia)

#| Retorna la lista l sin los primeros n elementos |#
(define (drop l n)
  (if (zero? n)
      l
      (drop (cdr l) (- n 1))))                     ; vas sacando elementos de l hasta que (n==0)    ; la llamada recursiva la hacemos directamente con el define en vez de una lambda

#| Retorna el indice del elemento buscado en la lista |# 
(define (obtener-indx elem l i)
    (cond                                          ; usamos un cond porque necesitamos verificar mas de una condicion
      ((null? l) #f) ; No encontrado
      ((equal? (car l) elem) i)
      (else (obtener-indx elem (cdr l) (+ i 1)))))

#| Retorna si las localidades de origen y destino son validas |# 
(define (valid-loc? loc-o loc-d l)
  (let ((indx-o (obtener-indx loc-o l 0))          ; usamos let porque no haciamos uso recursivo y tampoco necesitamos ver las asignaciones de la cabecera (asig anteriores) para las asignaciones posteriores
        (indx-d (obtener-indx loc-d l 0)))
    (cond                                 ; retorna: 
      ((or (not indx-o) (not indx-d)) #f) ;  si alguno no está
      ((< indx-o indx-d) #t)              ;  si origen está antes que destino
      (else #f))))                        ;  si no está antes que destino

#| Retorna si la hora1 es menor o igual que la hora2 |#
(define (h<=? h1 h2)                            ; h1, h2 son 2 listas con (hora minutos)
  (cond ((< (car h1) (car h2)) #t)
        ((and (equal? (car h1) (car h2))
              (<= (cadr h1) (cadr h2))) #t)
        (else #f)))

#| Retorna si el horario ingresado es válido |#
(define (hora-valida? h)
  (and (list? h)
       (= (length h) 2)                      ; se fija que tenga el formato (hora minutos)
       (number? (car h))
       (number? (cadr h))
       (>= (car h) 0) (<= (car h) 23)
       (>= (cadr h) 0) (<= (cadr h) 59)))

#| Dado un Horario y una lista de Horarios, retorna los más próximos |#
(define (obtener-horarios h-actual h-list)
  (cond 
    ((null? h-list) '())
    ((not (h<=? h-actual (car (reverse h-list)))) '())
    ((h<=? h-actual (car h-list)) h-list)
    (else (obtener-horarios h-actual (cdr h-list)))))

#| Obtener una sublista dado los indices |#
(define (sublista l inicio fin)
  (take (drop l inicio) (- fin inicio)))

#| Obtener el costo |#
(define (obtener-costo loc-o loc-d)
  (let ((indx-o (obtener-indx loc-o localidades 0))
        (indx-d (obtener-indx loc-d localidades 0)))
    (apply + (sublista costos indx-o indx-d))))                 ; apply toma c/elemento de la lista costos (desde indx-o hasta indx-d) y los suma  ;(apply * '(1 2 3 4)) ; → 24

#| -------------------------------------------------------------------- |#
                         #| Funcion Principal |#
#| -------------------------------------------------------------------- |#

(define (ArgentinaTur consulta)
  (let* ((origen (car consulta))                ; no hace falta el let*
         (destino (cadr consulta))
         (hora (caddr consulta)))
    (cond
      ((not (= (length consulta) 3))
       "ERROR! - Ingrese una lista de 3 argumentos!")
      ((not (valid-loc? origen destino localidades))
       "ERROR! - Localidades no válidas!")
      ((not (hora-valida? hora))
       "ERROR! - Horario no válido. Debe ser formato (hh mm) y estar entre (00 00) y (23 59)")    ; validacion
      (else
       (let* ((i-origen (obtener-indx origen localidades 0))     ; let* () --> con let* puedo ver las asignaciones de la cabecera (asig anteriores) para las asignaciones posteriores
              (hs (obtener-horarios hora (list-ref horarios i-origen))))
         (if (null? hs)
             (list (list origen destino) 0 "NO HAY HORARIOS DE SALIDA DISPONIBLES")
             (list (list origen destino)
                   (obtener-costo origen destino)
                   hs)))))))

#| -------------------------------------------------------------------- |#
                       #| Ejemplos de Uso |#
#| -------------------------------------------------------------------- |#

(ArgentinaTur '("Córdoba Capital" "La Falda" (10 30)))
(ArgentinaTur '("Valle Hermoso" "La Cumbre" (09 00)))
(ArgentinaTur '("Córdoba Capital" "La Falda" (16 00)))
(ArgentinaTur '("La Falda" "Córdoba Capital" (10 00)))
(ArgentinaTur '("La Falda" "La Falda" (10 00)))
(ArgentinaTur '("Córdoba Capital" "La Falda" "Valle Hermoso"))
(ArgentinaTur '("Córdoba Capital" "La Falda" (25 70)))