# Número máximo hasta el que se calcularán las series
MAX=1000
FICHERO=pasos

make

echo -e "\n--- COMIENZO DE LA EJECUCIÓN ----\n"

for i in $(seq $MAX)
do
	if [[ $((i % 100)) == 0 ]]
	then
		echo "Calculando la serie comenzando en $i..."
	fi

	# Filtra la salida a la última línea y separa las columnas para obtener el valor final del paso
	salida=$(./collatz $i | awk '{ if (match ($0, "^Paso[ ]*[0-9]+:[ ]*1$")) { split ($0, array, " ");  printf ("%5s\n", substr(array[2],1,length(array[2] - 1)) ); } }')

	printf "%5s: %5s pasos\n" "$i" "$salida" >> "$FICHERO"
done

# Ordena el fichero con los pasos y obtiene el mayor
echo -e "\nMayor cantidad de pasos (entre 2 y $MAX) con el número " $(sort -k2 -nr "$FICHERO" | head -n 1) "\n"
rm "$FICHERO"

make clean
