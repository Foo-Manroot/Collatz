# Indica código en 32 bits
.code32


.section .rodata
	form_err_args:
		.asciz "Error -> Llamada correcta: \n\t%s <número_inicial>\n"
	form_inicio:
		.asciz "\nNúmero inicial: %i\n"
	form_paso:
		.asciz "\nPaso %5i: %10li"
	msg_fin:
		.asciz "\n---- FIN DE LA SERIE ----\n"

.section .text
.globl _start
_start:
	# Inicializa el puntero de pila
	mov	%esp, %ebp

	# Obtiene los argumentos proporcionados por línea de comandos (argc está en
	# %esp, y argv[0] en 4(%esp), argv[1] en 8(%esp)...)
	cmp	$2, (%ebp)
	je	cont

	# Si ebp != 2 (no hay args) -> imprimir error y salir
	# printf ($form_err_args, argv [0])
	pushl	4(%ebp)
	pushl	$form_err_args
	call	printf
	add	$8, %esp

	pushl	$-1
	call	exit

# ebp == 2
cont:
	# Obtiene en EAX el valor numérico de argv [1]
	pushl	8(%ebp)
	call	obtener_arg
	add	$4, %esp

	# printf ($form_inicio, argv [1]).
	pushl	%eax
	pushl	$form_inicio
	call	printf
	add	$4, %esp
	popl	%eax

	# Llama a la función para imprimir la serie
	pushl	%eax
	call	collatz
	add	$4, %esp

	# printf ($msg_fin)
	pushl	$msg_fin
	call	printf
	add	$4, %esp

	pushl	$0
	call	exit


####
# FUNCIONES AUXILIARES
####


####
# Función para imprimir los números de la serie
#
# Args (por pila):
#	-> El número inicial de la serie
####
collatz:
	pushl	%ebp
	# Guarda los registros usados: EAX, ECX, EDX
	pushl	%eax
	pushl	%ecx
	pushl	%edx

	# Obtiene el argumento y lo carga en EAX
	movl	20(%esp), %eax

	xor	%ecx, %ecx

	# Primero imprime el paso 0 y luego sigue con el bucle (do-while)
	jmp collatz_bucle_imprimir

	# Fin del bucle -> EAX = 1
	#
	# Se usan los siguientes registros:
	#	-> EAX para almacenar el valor actual del número
	#	-> ECX como contador de pasos
	#	-> EDX como registro auxiliar para las operaciones
	collatz_bucle:
		cmpl	$1, %eax
		jle	collatz_fin

		inc	%ecx
		# Comprueba si EAX es par (si el LSB es 0)
		movl	$1, %edx
		and	%eax, %edx
		jz	collatz_bucle_elem_par	# Si ZF = 1 -> el bit está a 0 -> es par

		# Es impar: EAX <- (3 * EAX) + 1
		pushl	%ecx		# Guarda ECX
		movl	$3, %ecx
		mul	%ecx		# EDX:EAX <- EAX * 3 (EDX se ignora)
		popl	%ecx		# Recupera ECX

		inc	%eax

		jmp collatz_bucle_imprimir
		collatz_bucle_elem_par:

			pushl	%ecx		# Guarda ECX
			movl	$2, %ecx
			div	%ecx		# EAX <- EDX:EAX / 2 (en ECX), EDX <- 0
			popl	%ecx		# Recupera ECX

		collatz_bucle_imprimir:
			# Guarda EAX y ECX
			pushl	%eax
			pushl	%ecx

			# printf ($form_paso, paso, num)
			pushl	%eax
			pushl	%ecx
			pushl	$form_paso
			call	printf
			add	$12, %esp

			# Restaura EAX y ECX
			popl	%ecx
			popl	%eax

			jmp collatz_bucle

	collatz_fin:
		# Restaura los registros usados: EAX, ECX, EDX
		popl	%edx
		popl	%ecx
		popl	%eax

		popl	%ebp
		ret


####
# Función para obtener el valor numérico de la cadena pasada en argv [1] (el número
# inicial de la serie).
# Para ello, comprueba bytes hasta que encuentra 0x00.
#
# Args (por pila):
#	-> La dirección de memoria del argumento a comprobar (el valor de X(%ebp) )
#
# Devuelve:
#	%EAX: El valor numérico del argumento
####
obtener_arg:
	pushl	%ebp
	# Guarda los registros usados: EBX, ECX, EDX
	pushl	%ebx
	pushl	%ecx
	pushl	%edx

	# Primer argumento (esp + 20) -> Puntero al inicio de la memoria a comprobar
	mov	20(%esp), %ebx

	# Inicializaciones
	xor	%eax, %eax
	xor	%edx, %edx
	mov	$10, %ecx


	# Fin del bucle -> El Byte actual es 0x00
	#
	# Se usan los siguientes registros:
	#	-> EAX como acumulador del valor numérico
	#	-> EBX como puntero al Byte a comprobar
	#	-> ECX como constante (10, para la multiplicación)
	#	-> EDX para obtener el valor actual
	obtener_arg_bucle:
		cmpb	$0, (%ebx)
		je	obtener_arg_fin

		# Comprueba que es un número (entre 30h y 39h)
		cmpb	$0x30, (%ebx)
		jl	obtener_arg_fin
		cmpb	$0x39, (%ebx)
		jg	obtener_arg_fin

		# Como el argumento está en caracteres, hay que sustraer 30h
		mov	(%ebx), %dl
		sub	$0x30, %dl

		# Multiplica lo acumulado por 10 y le suma lo nuevo
		pushl	%edx
		mul	%ecx		# EDX:EAX <- EAX * 10
		popl	%edx

		add	%edx, %eax	# EDX <- EDX + EAX

		inc	%ebx
		jmp	obtener_arg_bucle

	# Sale de la función obtener_arg
	obtener_arg_fin:

		# Restaura los registros usados: EAX, EBX, ECX y EDX
		popl	%edx
		popl	%ecx
		popl	%ebx

		popl	%ebp
		ret
