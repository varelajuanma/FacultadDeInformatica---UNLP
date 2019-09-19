						{Pca. 2 - Ej. 4}

{4.- Se lee información relativa a un conjunto de valores que representa la cantidad de especies de pájaros de 14 países
de América. Informar los 2 países con menor cantidad de especies. Además, se desea saber qué porcentaje de países tienen 
más de 40 especies.}

program Ej4P2;
var 
  i: integer;
  num: integer;
  masde40esp: integer;
  pais1: integer;
  pais2: integer;
  cantpais1: integer;
  cantpais2: integer;
  porcentaje: real;

  
begin
  masde40esp:= 0;
  pais1:= 0;
  pais2:= 0;
  cantpais1:= 1000;
  cantpais2:= 2000;
  porcentaje:= 0;
  
  for i:= 1 to 14 do begin
      write('Ingrese la cantidad de especies de pajaros correspondientes al pais: ', i,' : '  );
	  read (num);
	  if (num > 40) then
	    masde40esp:= masde40esp + 1;
	  if (num < cantpais1) then begin
	    cantpais2:= cantpais1;
		pais2:= pais1;
		cantpais1:= num;
		pais1:= i;
      end
	  else
	    if (num < cantpais2) then begin
		  cantpais2:= num;
		  pais2:= i;
		end;
    end;
  porcentaje:= ((masde40esp*14)/100);
  writeln ('Los paises con menor cantidad de especies son: ', pais1, ' y ' , pais2,' : '  );
  writeln ('El ', porcentaje:2:2, ' % de paises tienen mas de 40 especies de pajaros');
  write('Pulse ENTER para finalizar');
  readln();
  readln();
end.
		
		
		
		
	  
	  
