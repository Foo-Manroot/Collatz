#include "common.hpp"

/**
 * Prints the current step with its value with the proper format.
 */
void print_step (int step, unsigned long value)
{
	std::cout << "\nPaso "
		<< std::setw (5) << std::right << step
		<< ": "
		<< std::setw (10) << std::right << value
	;
}

int main (int argc, char* argv [])
{
	int paso = 0;
	unsigned long init = 0;

	/* Checks the arguments */
	if (argc != 2)
	{
		std::cout << "Error -> Llamada correcta: \n"
			"\t" << argv [0] << " <número_inicial>\n"
		;
		return ERR_ARGS;
	}

	init = atol (argv [1]);
	CollatzGen series = CollatzGen (init);

	std::cout << "\nNúmero inicial: " << init << "\n";
	print_step (paso, init);

	while (series.has_more ())
	{
		paso++;
		print_step (paso, series.get_next ());
	}

	std::cout << "\n---- FIN DE LA SERIE ----\n";

	return SUCCESS;
}
