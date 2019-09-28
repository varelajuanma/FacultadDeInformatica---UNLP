#!/bin/bash
#recibe como parametro un nombre de archivo e informa si existe o no.
#si exsite muestra si es directorio o archivo
#si no existe el archivo/directorio crea un directorio con el nombre recibido como parametro

if [ $# -ne 0 ]
then	
	if [ -f $1 ]
	then
		echo "Existe y es un archivo"
	elif [ -d $1 ]
	then
		echo "Existe y es un directorio"
	else
		echo "No existe archivo/directorio. Creando directorio $1"
	fi
		
else	
	echo "Debe pasar un nombre de archivo/directorio como parametro"
fi
