#!/bin/bash
#dado el array multiplicarlo atravez de una funcuion

num=(11 3 5 7 9 3 5 4)


productoria()
{
	resultado=1
	for x in ${num[*]}
	do
		#echo $x
		resultado=`expr ${resultado} '*' ${x}`
	done
	echo "El resultado de la multiplicacion es: $resultado"

}

productoria ${num[*]}
