#!/usr/bin/python
# -*- coding: utf-8 -*-
import sys


def collatz (num):
    """
    Función para implementar el bucle principal

     Args:
        num -> Número cuya serie va a ser impresa
    """
    paso = 0
    while num > 1:
        if (num % 2) == 0:
            num /= 2
        else:
            num *= 3
            num += 1

        paso += 1
        print "Paso %5i: %10li" % (paso, num)

    return

# Comprueba los argumentos
if len (sys.argv) != 2:
    print "Error -> Llamada correcta: \n\t%s <número_inicial>\n" % sys.argv [0]
    exit (-1)

# Obtiene el número e inicia la serie
num = long (sys.argv [1])

print "\nNúmero inicial: %li" % num
collatz (num)
print "---- FIN DE LA SERIE ----"
