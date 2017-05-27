HAI 1.2
	CAN HAS STDIO?

	OBTW
		Función para obtener la entrada por STDIN

		Args:
			Ninguno.

		Devuelve:
			El número introducido por STDIN (o 0, si no se introdujo
			uno válido).
	TLDR
	HOW IZ I obtener_entrada
		I HAS A entrada
		I HAS A num ITZ A NUMBR

		VISIBLE "Introdzca el número de inicio de la serie: "
		GIMMEH entrada

		BTW Cast explícito para asegurar que el valor devuelto sea un número
		num R MAEK entrada A NUMBR

		FOUND YR num
	IF U SAY SO


	OBTW
		Función principal para calcular e imprimir la serie.

		Args:
			num -> Número en el que empezar la serie.

		Devuelve:
			Nada.
	TLDR
	HOW IZ I collatz YR num

		I HAS A paso ITZ 0
		BTW Bucle principal para ir imprimiendo los pasos
		IM IN YR bucle UPPIN YR paso

			VISIBLE "Paso " paso ": " num
			DIFFRINT 2 AN SMALLR OF 2 AN num
			O RLY?
				YA RLY
					BTW Como num <= 1, sale del bucle
					GTFO
				NO WAI
					BTW Comprueba (num mod 2)
					BOTH SAEM MOD OF num AN 2 AN 0
					O RLY?
						YA RLY
							num R QUOSHUNT OF num AN 2
						NO WAI
							num R SUM OF 1 AN PRODUKT OF num AN 3
				OIC
			OIC

		IM OUTTA YR bucle

		GTFO
	IF U SAY SO


	OBTW
		Se llama a las funciones encargadas de obtener la entrada por teclado y mostrar
		la serie por pantalla
	TLDR
	I HAS A num ITZ I IZ obtener_entrada MKAY
	VISIBLE ":)Número inicial: " num
	I IZ collatz YR num MKAY
	VISIBLE ":)---- FIN DE LA SERIE ----:)"

KTHXBYE
