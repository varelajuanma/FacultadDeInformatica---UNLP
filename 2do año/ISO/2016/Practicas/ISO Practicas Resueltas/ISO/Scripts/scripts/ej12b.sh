#!/bin/bash
# 2 numeros como parametro, imprima la suma,resta,multiplicacion, y cual
#es el mayor de los dos

if [ $# -ne 0 ]
then
	echo -n "La suma de $1 mas $2 es: "
	echo `expr $1 + $2`
	echo -n "La resta de $1 menos $2 es: "
	echo `expr $1 - $2`
	echo -n "La multiplicacion entre $1 por $2 es: "
	echo `expr $1 '*' $2`
	if [ $1 -lt $2 ]
	then
		echo "El numero mayor es $2"
	else
		echo "El numero mayor es $1"
	fi
else
	echo "No pasaste ningun argumento"
fi
