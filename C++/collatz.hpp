#ifndef COLLATZ_HPP
#define COLLATZ_HPP


/********************/
/* CLASS DEFINITION */
/********************/

/**
 * Generator to get the whole series by successive calls to get_next ()
 */
class CollatzGen
{
public:
	/**
	 * Constructor
	 */
	CollatzGen (unsigned long initial) :
		current_n (initial)
	{}

	/**
	 * Destructor
	 */
	virtual ~CollatzGen ()
	{}

	/**
	 * Returns the last calculated value of the series, without calculating a new
	 * one.
	 */
	unsigned long get_current ();

	/**
	 * Calculates and returns the next element of the series.
	 */
	unsigned long get_next ();

	/**
	 * Checks if the series has more items
	 *
	 * Returns:
	 *	-> true, if there are still items on the series,
	 *	or
	 *	-> false, if there are no more items
	 */
	bool has_more ();


private:
	/**
	 * Calue of the current element of the series
	 */
	unsigned long current_n;
};

#endif /* ifndef COLLATZ_HPP */
