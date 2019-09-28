#!/bin/bash
#verificar cada 10 seg si un usuario se ha logueado en el sistema, el nombre viene por parametro
#cuando se loguea debe mostrar  "Usuario $1 logueado en el sistema"

control()
{
	for user in `who | cut -d " " -f1`
	do
		if [ $user == $1 ]
		then
			echo "Usuario $1 logueado en el sistema"
			exit
		fi
	done

}

if [ $# -eq 1 ]
then
	control $1
	while [ 0 -lt 1 ]
	do
		sleep 10; control $1
	done
else
	echo "Debe pasar un nombre de usuario"

fi
