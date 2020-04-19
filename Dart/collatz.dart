
/* This is the help text that shows the usage of this program */
const String usage = """Usage:
dart collatz.dart [num | -h | --help]

Where:
    num
            Is the initial number of the series

    -h
    --help
            Prints this help text and exits
""";

/**
 * Iterator to yield each number of the series.
 *
 * @param initial: int
 *          Initial number of the series
 *
 *
 * @return: Iterator<int>
 *         Generator for each element of the series
 */
Iterable<int> collatzIterator (int initial) sync* {

    yield initial;
    /* while (initial > 1) {...} would be way more optimal, but this weird construct
    allows me to learn more Dart things */
    if (initial > 1) {

        yield* (initial % 2) == 0?
            /* This division will always return an int, but the compiler complains, so
            we force it to be an int */
            collatzIterator (initial ~/ 2)
            :
            collatzIterator ((initial * 3) + 1)
        ;
    }
}


/**
 * Main function
 */
void main (List<String> args) {

    if ((args.length != 1)
        || (args [0] == "-h")
        || (args [0] == "--help")
    ) {
        print (usage);
        return;
    }

    /* The first argument should be a number. If it isn't, an exception will be thrown
    and caught */
    try {

        int initial = int.parse (args [0]);
        print ("Starting at ${initial}");

        Iterable<int> series = collatzIterator (initial);
        int step = 0;
        for (int elem in series) {

            /* Dart doesn't have any 'printf' equivalent foramt, so we just convert the
            number and pad it with spaces to simulate "%10d" format */
            String padded_elem = elem.toString ().padLeft (10, " ");

            /* Step is incremented before being padded */
            String padded_step = (++step).toString ().padLeft (5, " ");

            print ("Step ${padded_step}: ${padded_elem}");
        }

    } on FormatException catch (e) {

        print ("${e}\n----\n${usage}");
    }
}
