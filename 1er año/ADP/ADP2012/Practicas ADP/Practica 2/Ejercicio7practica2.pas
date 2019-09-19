Program ejer7prac2;
var
  paciente:string[20];
  dni:integer;
  sexo:char; {F si es femenino y M si es masculino}
  edad:integer;
  edadtotalhombres:integer;
  promedio:real;
  max1edadmujer:integer;
  max2edadmujer:integer;
  dnimax1:integer;
  dnimax2:integer;
  totalhombres:integer;
begin
  edadtotalhombres:=0;
  promedio:=0;
  max1edadmujer:=0;
  max2edadmujer:=0;
  dnimax1:=0;
  dnimax2:=0;
  totalhombres:=0;
  writeln('ingrese el DNI del paciente');
  readln(dni);
  while (dni <> -1) do begin
    writeln('ingrese el nombre del paciente');
    readln(paciente);
    writeln('ingrese el sexo');
    readln(sexo);
    writeln('ingrese la edad');
    readln(edad);
    if (sexo = 'M') then
      edadtotalhombres:= edadtotalhombres + edad;
      totalhombres:=totalhombres + 1;
    if (sexo = 'F') then begin
      if (edad > max1edadmujer) then begin
        max2edadmujer:=max1edadmujer;
        max1edadmujer:=edad;
        dnimax2:=dnimax1;
        dnimax1:=dni;
      end
      else
        if (edad > max2edadmujer) then begin
          max2edadmujer:=edad;
          dnimax2:=dni;
        end;
    end;
    writeln('ingrese el DNI del siguiente paciente');
    readln(dni);
  end;
  promedio:=edadtotalhombres div totalhombres;
  writeln('la edad promedio de los hombres es ',promedio);
  writeln('el dni de la mujer de mayor edad es ',dnimax1);
  writeln('el dni de la segunda mujer de mayor edad es ',dnimax2);
  readln;
  readln;
end.
