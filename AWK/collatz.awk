#!/usr/bin/awk -f

BEGIN {
	inicio = ARGV [1]

	# Comprueba que el argumento sea un valor entero
	if (inicio == "" || !(inicio ~ /^[0-9]+$/)) {

		script = ENVIRON ["_"]
		printf ("Error -> Llamada correcta: \n\t%s <número_inicial>\n", script)
	} else {

		paso = 0
		n = inicio

		printf ("\nNúmero inicial: %li\n", inicio);
		printf ("\nPaso %5i: %10li", paso, n);
		while (n >= 2) {

			if (n % 2 == 0) {

				n /= 2
			} else {

				n /= 3
				n ++
			}

			printf ("\nPaso %5i: %10li", ++paso, n);
		}

		printf ("\n---- FIN DE LA SERIE ----\n");
	}
}
