#!/bin/bash
#solicite al usuario 2 numeros, imprima la suma,resta,multiplicacion, y cual
#es el mayor de los dos


echo -n "Ingrese primer numero: "
read n1
echo -n "Ingrese segundo numero: "
read n2
echo -n "La suma de $n1 mas $n2 es: "
echo `expr $n1 + $n2`
echo -n "La resta de $n1 menos $n2 es: "
echo `expr $n1 - $n2`
echo -n "La multiplicacion entre $n1 por $n2 es: "
echo `expr $n1 '*' $n2`
if [ $n1 -lt $n2 ]
then
	echo "El numero mayor es $n2"
else
	echo "El numero mayor es $n1"
fi

