
								{Pca.2 - Ej. }

{5.-  Se desea procesar la informaci�n de alumnos de ocho carreras universitarias. De cada 
carrera se lee su c�digo, cantidad de a�os de duraci�n y cantidad de alumnos que cursa cada 
a�o. Se pide informar la carrera que tiene la mayor cantidad promedio de alumnos por a�o.}

program Ej5p2;

var
  i: integer;
  k: integer;
  codigo: integer;
  cantanios: integer;
  cantalumnos: integer;
  carreramayor: integer;
  alumnoscarrera: real;
  promedio: real;
  promediocarreramayor: real;
  
begin
  carreramayor:= 0;
  promediocarreramayor:= -1;
  for i:= 1 to 8 do
    begin
    alumnoscarrera:= 0;
	  promedio:= 0;
    write(' Ingrese el codigo de la carrera: ', i,' : '  );
	  read (codigo);
	  write (' Ingrese la cantidad de anios de duracion de la carrera : ');
	  read (cantanios);
	  for k:= 1 to cantanios do
        begin
	      write (' Ingrese la cantidad de alumnos del anio ' ,k, ' : ');
        read (cantalumnos);
	      alumnoscarrera:= alumnoscarrera + cantalumnos;
        end;
        promedio:= alumnoscarrera / cantanios;
        if (promedio > promediocarreramayor) then
          begin
            promediocarreramayor:= promedio;
            carreramayor:= i;
          end;
    end;
writeln ('La carrera con mayor cantidad de promedio de alumnos es: ', carreramayor,' : '  );
write ('Presione ENTER para finalizar');
readln();
readln();
end.
