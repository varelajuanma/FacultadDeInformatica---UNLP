#!/bin/bash
#dados dos vectores de longitud igual, pero no se conocen, sumar elemento a elemento e imprimir

vector1=(1 15 9 20)
vector2=(3 1 10 40)

for((i=0; i<${#vector1[@]}; i++))
do
	echo "La suma de los elementos de la posicion $i es : `expr ${vector1[$i]} + ${vector2[$i]}`"
done


