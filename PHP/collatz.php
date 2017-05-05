<!DOCTYPE HTML>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" type="text/css" href="style.css" >
</head>
<body>

	<div id="main">
	<?php
		$paso = 0;
		$num = 120;

		/* Obtiene el parámetro, si existe */
		if (!empty ($_GET ["num"])
		    && is_numeric ($_GET ["num"])) {

			$num = $_GET ["num"];
		}

		printf ("\n\tNúmero inicial: %d\n", $num);

		while ($num > 1) {

			if (($num % 2) == 0) {

				$num /= 2;
			} else {

				$num *= 3;
				$num++;
			}

			$paso++;
			printf ("\tPaso %5d: %10d\n", $paso, $num);
		}

		printf ("\t---- FIN DE LA SERIE ----\n");
	?>
	</div>
</body>
</html>
