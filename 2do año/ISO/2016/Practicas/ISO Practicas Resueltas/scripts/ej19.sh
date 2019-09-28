#!/bin/bash
#muestra un menu con la selecciona de cada uno de los scripts creados.
#el menu debe permanecer activo hasta que se precione salir

while [ 0 -ne 1 ]
do
	echo "MENU DE COMANDOS"
	echo "01. Script 1"
	echo "00. Salir"
	echo -ne "Ingrese numero de opcion a ejecutar: "
	read opcion
	case $opcion in
		01)
			echo "eligio la opcion 01"
		;;

		00)
			exit
		;;
	
		*)
		;;
	esac
done		
