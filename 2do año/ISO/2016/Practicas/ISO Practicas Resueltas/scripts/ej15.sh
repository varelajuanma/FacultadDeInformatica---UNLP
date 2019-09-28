#!/bin/bash
#cut
#ls -l | cut -d " " -f 1,2 muestra columnas 1 y 2 delimitados por " "
#ls -l | tr -s " " | cut -d " " -f 1,2 el tr me elimina " " repetidos y me deja solo uno

	echo `man cut`
