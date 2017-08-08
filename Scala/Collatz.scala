
/**
 * Objeto en el que se implementan todas las funciones, que se llamarán desde main
 */
object Collatz {

  def main (args: Array [String]) = {

    val n = comprobar_arg (args)

    if (n > 1) {

      println ("\nNúmero inicial: " + n + "\n")
      collatz (n)
      println ("---- FIN DE LA SERIE ----")
    }
  }

  /**
   * Calcula el siguiente término de la serie de Collatz y lo imprime.
   * Si es el último, sale.
   *
   * @param n
   *           Número anterior en la serie.
   * @param paso
   *           Paso actual en la recursividad.
   */
  def collatz (n: Long, paso: Int = 0): Unit = {

    println ("Paso %5d: %10d".format (paso, n))

    if (n > 1) {

      if ((n % 2) == 0) {

        collatz (n / 2, paso + 1);
      } else {

        collatz (3 * n + 1, paso + 1)
      }
    }

  }

  /**
   * Comprueba que esté el argumento necesario
   *
   * @param args
   *        Array con los argumentos pasados por línea de comandos
   *
   * @return
   *        El número cuya serie se debe calcular, o
   *        -1 si no hay un argumento válido
   */
  def comprobar_arg (args: Array [String]): Long = {

    if (args.length != 1) {

      println ("Error -> Llamada correcta: \n\tscala Collatz <número_inicial>");
      -1
    } else {

      val n = args (0)
      if (esNum (n)) n.toLong else -1
    }
  }

  /**
   * Comprueba si la cadena es un número.
   *
   * @param x
   *        Cadena que se desea comprobar
   *
   * @return
   *        true si todos los elementos de la cadena son dígitos; o false si no.
   */
  def esNum (x: String): Boolean = !x.isEmpty && x.forall (Character.isDigit);

}
