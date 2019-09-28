#!/bin/bash
# imprimir lo que devuelve una funcion

function funcion
{
	return 1
}

funcion
echo $?
