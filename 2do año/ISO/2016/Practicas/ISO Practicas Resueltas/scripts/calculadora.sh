#!/bin/bash
#calculadora, recibe la operacion y los numeros por parametro
#ejemplo: 2 + 2

if [ $# -eq 3 ]
then
	case $2 in
	+)
		echo "La suma entre $1 y $3 es `expr $1 + $3`"
	;;
	-)
		echo "La resta entre $1 y $3 es `expr $1 - $3`"
	;;
	'*')
		echo "La multiplicacion entre $1 y $3 es `expr $1 '*' $3`"
	;;
	%)
		echo "La division entre $1 y $3 es `expr $1 / $3`"
	;;
	*)
	;;
	esac
else
	echo "Numero de parametros incorrectos. Ejemplo: 2 + 2"
fi
