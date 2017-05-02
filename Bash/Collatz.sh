#!/bin/bash

# Número inicial de la serie
NUM=1

# Comprueba los argumentos y establece las variables de manera acorde
comprobar_args ()
{
	# Sólo se admite un argumento
	if [[ "$#" -ne 1 ]]
	then
		echo -e "Error -> Llamada correcta: \n\t$0 <número_inicial>"
		exit -1
	else
		# Comprueba que sea un número
		if [ "$1" -eq "$1" ] 2>/dev/null
		then
			NUM=$1
		else
			echo "El argumento '$1' no es un número"
			exit -1
		fi
	fi
}

# Bucle principal para calcular la serie
collatz ()
{
	paso=1
	valor=$1

	while [[ "$valor" -gt 1 ]]
	do
		if [[ $((valor % 2)) -eq 0 ]]
		then
			valor=$((valor / 2))
		else
			valor=$(( (3 * valor) + 1))
		fi

		paso=$((paso + 1))

		printf "Paso %5i: %10li\n" $paso $valor
	done
}


comprobar_args "$@"
echo -e "\nNúmero inicial: $NUM"
collatz $NUM
echo -e "---- FIN DE LA SERIE ----"
