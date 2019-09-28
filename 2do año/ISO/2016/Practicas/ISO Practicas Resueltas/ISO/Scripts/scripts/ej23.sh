#!/bin/bash
#recorre un arreglo e imprime los numeros pares, y cuenta los numeros impares

vector=(1 2 3 4 5 6 7 8 9 10)

impares=

for elem in ${vector[@]}
do	
	mod=`expr $elem % 2`
	if [ $mod -eq 0 ]
	then
		echo $elem			
	else
		let impares++
	fi
done
echo "La cantidad de numeros impares es $impares"




