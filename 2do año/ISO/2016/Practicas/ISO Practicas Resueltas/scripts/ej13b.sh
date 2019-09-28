#!/bin/bash
#mostrar 3 opciones, segun la elegida listo, pwd, y quien

echo "1) Listar el contenido del directorio actual"
echo "2) El nombre del directorio actual"
echo "3) Quien esta logeado al sistema"
echo -ne "Ingrese numero de opcion: "
read opcion
case $opcion in
	1)
		echo "El contenido del directorio actual es `ls -l`"
	;;
	2 )
		echo "La ruta del directorio actual es `pwd`"
	;;
	3)
		echo "Estas logeado al sistema como `whoami`"
	;;
	*)
		echo "Opcion incorrecta"
	;;
esac

