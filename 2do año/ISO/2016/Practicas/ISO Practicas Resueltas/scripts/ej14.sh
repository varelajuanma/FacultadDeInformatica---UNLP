#!/bin/bash
#renombra archivos, recibe el directorio pasado como parametro
#-a CADENA al final
#-b CADENA al principio

recorrer ()
{
	cd $1
	for i in `ls`
	do
		if [ -f "$i" ]
		then
			renombrar $2 $3 "$i"
		fi
			
        done
	
}

renombrar()
{
	if [ $1 = "-a" ]
	then
		mv $3 ${3}${2}
	else
		mv $3 ${2}${3}
	fi
}

if [ $# -eq 3 ]
then
	recorrer $1 $2 $3 
else
	echo "Cantidad incorrecta de parametros"
fi
