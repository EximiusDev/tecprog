; Ejerc4

;(car (1 2 3 4))
(car '(1 2 3 4)) ; EJEMPLO

;(cdr (1 2 3 4))
(cdr '(1 2 3 4)) ; EJEMPLO

; 4) Obtengaelelementoxdelassiguienteslistas

; '(a b c . x)
(cdr'(a b c . x))
(cdr (cdr'(a b c . x)) )
(cdr (cdr (cdr'(a b c . x)) )); cuando llegas a (c . x)
;toma como una lista impropia (por definicion es: (a . b))

;  '(a b c x)


;  '((a.x)b)


;  '((a.x)b)


;  '(x.a)


;  '(a.x)