program Ej3P2;
var
  codigo: integer;
  edad: integer;
  edadmax: integer;
  masde40: integer;
  cantper: integer;
  promedio: real;
 
begin
  edadmax:= -1;
  masde40:= 0;
  cantper:= 0;
  promedio:= 0;

  write('Por favor, ingrese un numero de codigo: ');
  read (codigo);
  while (codigo <> 999) do begin
    write('Por favor, ingrese la edad: ');
    read (edad);
    cantper:= cantper + 1;
	  if (edad > edadmax) then
	    edadmax:= edad;
    if (edad > 40) then
	    masde40:= masde40 + 1;
    write('Por favor, ingrese nuevamente un numero de codigo: ');
	  read (codigo);
  end;
  promedio:= ((cantper*masde40)/100);
  writeln ('La edad maxima encontrada entre los encuestados es :' ,edadmax,' anios!!!!' );
  writeln ('El ',promedio:2:2, ' % de las personas encuestadas, tiene mas de 40 anios!!!');
  write('Pulse ENTER para finalizar');
  readln();
  readln();
end.
