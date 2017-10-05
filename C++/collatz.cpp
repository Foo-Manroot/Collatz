#include "collatz.hpp"

/************************/
/* CLASS IMPLEMENTATION */
/************************/


/**
 * Returns the last calculated value of the series, without calculating a new
 * one.
 */
unsigned long CollatzGen::get_current ()
{
	return current_n;
}

/**
 * Calculates and returns the next element of the series.
 */
unsigned long CollatzGen::get_next ()
{
	current_n = ((current_n % 2) == 0)?
		(current_n / 2)
		:
		((current_n * 3) + 1)
	;
	return current_n;
}

/**
 * Checks if the series has more items
 *
 * Returns:
 *	-> true, if there are still items on the series,
 *	or
 *	-> false, if there are no more items
 */
bool CollatzGen::has_more ()
{
	return (current_n > 1);
}
