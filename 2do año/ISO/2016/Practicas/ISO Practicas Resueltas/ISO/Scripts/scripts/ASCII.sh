#!/bin/bash
#identificar archivos ASCII dentro de los home de usuario

virus=0
cd /home
for user in `ls`
do
	cd /home
	cd $user
	for archivo in `ls | grep ".txt"`
	do
		if [ `file $archivo | grep ASCII` == ]
		then
			echo "Es un virus $archivo"
			let virus++
		fi
	done
done
echo "La cantidad de archivos infectados eliminados es: $virus"
