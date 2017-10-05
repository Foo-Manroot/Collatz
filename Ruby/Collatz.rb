#!/usr/bin/ruby

=begin
	Añade un método a la clase String para comprobar si se trata de una cadena
	representando a un número entero positivo (los únicos aceptados en este programa)
=end
class String
	def es_entero_positivo?
		/^[+]?\d+$/.match? (self)
	end
end

=begin
	Clase con los métodos necesarios para imprimir la serie de Collatz
=end
class Collatz

	attr_accessor :num

	def initialize (num)
		@num = num
	end

	##
	# Calcula los términos de la serie y les aplica la función establecida.
	#
	# Debe recibir como cuerpo un bloque (int, int) => void, puesto que se llama
	# a yield(@num, paso).
	#
	# Args:
	# 	paso -> Contador del paso actual. Por defecto, es 0.
	#
	def calc_serie(paso=0)

		yield(@num, paso)
		paso += 1

		return if @num <= 1

		if (@num % 2 == 0)
			@num /= 2
			calc_serie(paso) { |n, p| yield(n, p) }
			# Restaura el valor para permitir más llamadas al método
			@num *= 2
		else
			@num *= 3
			@num += 1
			calc_serie(paso) { |n, p| yield(n, p) }
			# Restaura el valor para permitir más llamadas al método
			@num -= 1
			@num /= 3
		end
	end
end



num = 120

# Comprueba los argumentos para saber si hay algún número. Si lo hay, lo toma como
# el número inicial de la serie
#
#ARGV.each do
#	|a|
	if ARGV.length == 1 and ARGV[0].es_entero_positivo?

		num = ARGV[0].to_i
	else
		printf("Error -> Llamada correcta: \n\t%s <número_inicial>\n", __FILE__)
		exit -1
	end
#end


serie = Collatz.new (num)

puts "\nNúmero inicial: #{num}"
serie.calc_serie { |n, paso| printf("Paso %5i: %10i\n", paso, n) }
puts "\n---- FIN DE LA SERIE ----\n"
