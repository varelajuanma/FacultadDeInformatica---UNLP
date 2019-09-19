Program ejer6;
var
  dni,edad,totalh,edadh,edadmax1,edadmax2,dnimax1,dnimax2:integer;
  promedio:real;
  sexo:char;
begin
  totalh:=0;
  edadh:=0;
  edadmax1:=-1;
  edadmax2:=-1;
  promedio:=0;
  repeat
    write('ingrese DNI del paciente :');
    read(dni);
    write('ingrese edad del paciente :');
    read(edad);
    write('ingrese sexo del paciente :');
    read(sexo);
    if (sexo = 'M') then begin
      totalh:=totalh + 1;
      edadh:=edadh + edad;
      end
    else
      if (edad > edadmax1) then begin
        edadmax2:=edadmax1;
        edadmax1:=edad;
        dnimax1:=dni;
        end
      else
        if (edad > edadmax2) then begin
          edadmax2:=edad;
          dnimax2:=dni;
          end;
    until (dni = 32576121) and (sexo = 'F');
  promedio:=edadh/totalh;
  writeln('la edad promedio de los hombres es de :' );
  writeln('el DNI de la mujer mas grande es ',dnimax1,' y el de la segunda mas grande es ',dnimax2);
  readln;
  readln;
end.
