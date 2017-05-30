# Indica código en 32 bits
.code32

.section .data
	formato_inicio:
		.ascii "Num = %s"
	inicio:
		.ascii "asdf\n"

.section .text
.global main
main:
	# Obtiene los argumentos proporcionados por línea de comandos (argc está en
	# rdi, y argv en rsi)
	

	pushl $inicio
	call printf

	pushl $0
	call exit
