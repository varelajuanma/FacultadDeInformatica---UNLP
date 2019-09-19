program Ej7P2;

var
  DNI: integer;
  edad: integer;
  sexo: char; {'F' o 'M'}
  edadmujermax1: integer;
  edadmujermax2: integer;
  dnimax1: integer;
  dnimax2: integer;
  totalhombres: integer;
  totalaniosh: integer;
  edadpromedioh: integer;

begin
  edadmujermax1:= -1;
  edadmujermax2:= -1;
  dnimax1:= 0;
  dnimax2:= 0;
  totalhombres:= 0;
  totalaniosh:=0;
  edadpromedioh:= 0;

  writeln ('Ingrese un numero de DNI : ');
  readln (DNI);
  while (DNI <> -1) do
  begin
    writeln ('Ingrese "F" = Femenino o "M" = Masculino : ');
    readln (sexo);
    writeln ('Ingrese la edad : ');
	readln (edad);
	  if (sexo = 'M') then
      begin
	    totalaniosh:= totalaniosh + edad;
	    totalhombres:= totalhombres + 1;
      end
	  else
	    if (sexo = 'F') then
        begin
		  if (edad > edadmujermax1) then
          begin
		    edadmujermax2:= edadmujermax1;
			dnimax2:= dnimax1;
			edadmujermax1:= edad;
			dnimax1:= DNI;
		  end
		  else
		    if (edad > edadmujermax2) then
            begin
			  edadmujermax2:= edad;
			  dnimax2:= DNI;
            end;
        end;
	writeln ('Ingrese nuevamente un numero de DNI : ');
    readln (DNI);
  end;
  edadpromedioh:= totalaniosh div totalhombres;

  write (' La edad promedio de los hombres es de : ', edadpromedioh, ' Anios ');
  writeln ();
  write (' El DNI de la 1er. mujer con mayor edad es : ',dnimax1, ', y tiene ' ,edadmujermax1, ' Anios de edad ');
  writeln ();
  write (' El DNI de la 2da. mujer con mayor edad es : ', dnimax2, ', y tiene ' ,edadmujermax2, ' Anios de edad ');
  writeln ();
  write('Pulse ENTER para finalizar');
  readln();
end.


