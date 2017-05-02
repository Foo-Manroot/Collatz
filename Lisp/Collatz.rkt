; Función principal
;
; Argumentos:
;	n  -  Número inicial de la serie
;
(define (collatz n)

	(if (not (exact-positive-integer? n))
		(raise-argument-error 'collatz "exact-positive-integer?" n)
		(begin
			(printf "Inicio de la serie ~n")
			(collatz_rec n 0)
		)
	)
)

; Función auxiliar que imprime el paso actual de la serie
(define (collatz_rec n paso)

	(printf "Paso ~a: ~a~n" (~r paso #:min-width 5) (~r n #:min-width 10))
	(if (> n 1)
		(if (= (modulo n 2) 0)
			(collatz_rec (/ n 2) (+ paso 1))
			(collatz_rec (+ (* n 3) 1) (+ paso 1))
		)
		(printf "---- FIN DE LA SERIE ----~n")
	)
)
