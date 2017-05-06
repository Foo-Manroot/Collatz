
public class Collatz {

	/**
	 * Función principal.
	 * Comprueba los argumentos y llama a la función para imprimir la serie
	 *
	 * @param args
	 * 		Argumentos pasados por la línea de comandos.
	 */
	public static void main (String args []) {

		long n = 0;

		if (args.length != 1) {

			System.out.println ("Error -> Llamada correcta: "
					+ "\n\tjava Collatz <número_inicial>\n");
			System.exit (-1);
		}

		try {
			n = Long.parseLong (args [0]);
		} catch (NumberFormatException nfe) {

			System.out.printf ("Error: '%s' no es un número válido.", args [0]);
			System.exit (-2);
		}

		System.out.println ("\nNúmero inicial: " + n);
		imprimir_serie (n);
		System.out.println ("---- FIN DE LA SERIE ----\n");
	}

	/**
	 * Imprime la serie desde el número indicado.
	 *
	 * @param n
	 * 		Número inicial de la serie.
	 */
	public static void imprimir_serie (long n) {

		for (int paso = 1; n > 1; paso++) {

			n = ((n % 2) == 0)? (n / 2) : ((3 * n) + 1);
			System.out.printf ("Paso %5d: %10d\n", paso, n);
		}
	}
}
