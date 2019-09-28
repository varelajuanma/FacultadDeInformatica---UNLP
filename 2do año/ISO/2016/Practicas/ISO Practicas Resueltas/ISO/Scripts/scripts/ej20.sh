#!/bin/bash
#el comportamiento de una pila
#21) Dentro del mismo script y utilizando las funciones implementadas agregue 10
#elementos a la pila, saque 3 de ellos, imprima la longitud de la cola y luego la totalidad
#de los elementos que en ella se encuentran.

vector=()
index=0

print()
{
	for elem in ${vector[*]}
	do
		echo $elem
	done
}

function length
{
	return `expr $index + 1`
}

pop()
{
	unset vector[index]
	let index--
}

push()
{
	vector[index]=$1
	let index++
}

push 1
push 2
push 3
push 4
push 5
push 6
push 7
push 8
push 9
push 0
#el primer pop no hace nada
pop
pop
pop
pop
print
#imprimir valor de funcion

