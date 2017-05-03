

% Predicado inicial
%
% Argumentos
% 	N -> Número cuya serie se quiere imprimir
%
collatz(N) :- writef("\nNúmero inicial: %d\n", [N])
		, collatz(N, 0)
		.

% Predicados para N <= 1 (la serie ya ha acabado
%
% Argumentos
%	N -> Número cuya serie se quiere imprimir
%	Pasos -> Número de pasos acumulados
%
collatz(N, Pasos) :- N =< 1
		, writef("Paso %5r: %10r", [Pasos, N]), nl
		, format("---- FIN DE LA SERIE ----"), nl
		.

% Predicado para N > 1 y N par
%
% Argumentos
%	N -> Número cuya serie se quiere imprimir
%	Pasos -> Número de pasos acumulados
%
collatz(N, Pasos) :- N > 1
		, N rem 2 =:= 0
		, writef("Paso %5r: %10r", [Pasos, N]), nl
		, N1 is N / 2
		, P1 is Pasos + 1
		, collatz(N1, P1)
		.

% Predicado para N > 1 y N impar
%
% Argumentos
%	N -> Número cuya serie se quiere imprimir
%	Pasos -> Número de pasos acumulados
%
collatz(N, Pasos) :- N > 1
		, N rem 2 =\= 0
		, writef("Paso %5r: %10r", [Pasos, N]), nl
		, N1 is (N * 3) + 1
		, P1 is Pasos + 1
		, collatz(N1, P1)
		.
