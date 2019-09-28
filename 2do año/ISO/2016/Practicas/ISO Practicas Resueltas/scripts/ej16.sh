#!/bin/bash
#recivo por parametro una extension, y hace un reporte con 2 columnas, el nombre de user y la cantidad de archivos
#que posee con esa extension. Se guarda en un archivo llamado reporte.txt

# ls -l | cut -d " " -f 3  -> se queda con la columna de usuario tras un ls -l
#awk '{print $3,$4}' ls.txt imprime la columna 3 y 4 del archivo ls.txt

#`ls -l > ls.txt`
	#echo `awk '{print $3}' ls.txt | wc -l`
	#echo "$3"

# ls -l | cut -d " " -f 3  -> se queda con la columna de usuario tras un ls -l
#ls -l | tr -s " " | cut -d " " -f 3 te elimina los doble espacio "  "
#ls -l | grep '.sh' | wc -l me quedo con la cantidad de lineas .sh



if [ $# -eq 1 ]
then
	path=`pwd`
	string=
	cantidad=
	cd /home
	for user in `ls -l | tr -s " " | cut -d " " -f 3` 
	do	
		cd /home		
		cd $user
  		string=$user
		cantidad=`ls -l | grep $1 | wc -l`	
		echo $string"    "$cantidad >> $path"/reporte.txt"
	done		
else
	echo "No pasaste ningun parametro"
fi
