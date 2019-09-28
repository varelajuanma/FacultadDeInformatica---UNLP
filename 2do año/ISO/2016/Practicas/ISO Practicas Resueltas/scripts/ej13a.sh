#!/bin/bash
#visualizar en pantalla los numeros del 1 al 100 asi como sus cuadrados

for ((i=0;i<=100;i++))
do
	echo "Numero $i y su cuadrado `expr $i '*' $i`"
done 
