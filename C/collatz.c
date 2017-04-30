#include "collatz.h"

/**
 * Calcula el siguiente término de la serie de Collatz.
 * Si es el último, sale con código SUCCES.
 *
 * Argumentos:
 *	n 	-	Número anterior en la serie.
 *	paso	-	Paso actual en la recursividad.
 *
 *
 * Valor de retorno:
 *	SUCCESS si todo ha salido correctamente
 */
int collatz (long n, int paso)
{

	/* Caso base -> se ha alcanzado el número 1 */
	if (n <= 1)
	{
		return SUCCESS;
	}

	/*
	   Si n es par, imprime (n / 2).
	   Si no, imprime (3 * n + 1).
	 */
	if ((n % 2) == 0)
	{
		/* n <- (n / 2) */
		n /= 2;
	}
	else
	{
		/* n <- (3 * n + 1) */
		n *= 3;
		n++;
	}

	printf ("\nPaso %5i: %10li", ++paso, n);

	/* Llamada recursiva para calcular el siguiente
	elemento de la serie */
	return collatz (n, paso);
}

/**
 * Función principal. Obtiene los argumentos y
 * llama a la función para calcular la serie.
 */
int main (int argc, char* argv[])
{
	long inicio = 1;
	int cod_salida = SUCCESS;

	/* Comprueba los argumentos */
	if (argc != 2)
	{
		printf ("Error -> Llamada correcta: \n\t%s <número_inicial>\n", argv[0]);
		return ERR_ARGS;
	}

	inicio = atol (argv[1]);

	printf ("\nNúmero inicial: %li\n", inicio);

	/* Llama a la función para generar los números de la serie */
	if ((cod_salida = collatz (inicio, 0)) == SUCCESS)
	{
		printf ("\n---- FIN DE LA SERIE ----\n");
	}

	return cod_salida;
}
