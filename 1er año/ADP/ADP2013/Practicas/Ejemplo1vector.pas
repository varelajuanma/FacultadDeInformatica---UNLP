{Se lee el nombre y edad de alumnos. La lectura finaliza cuando se lee el nombre 'ZZZ'.
El rango de edad esta entre 18 y 60. Informar para cada edad cuantos alumnos hay}

Program ejerejemplo;
type
  cadena30 = string [30];
  rango = 18 .. 60;
  vector = array [18 .. 60] of integer;
  alumno = record
          nombre:cadena30;
          edad:rango;
          end;

procedure leeralumno (var al:alumno);
  begin
    write('Ingrese el nombre del alumno: ');
    readln(al.nombre);
    if (al.nombre <> 'ZZZ') then begin
      write('Ingrese la edad del alumno: ');
      readln(al.edad);
      end;
  end;

var
  al:alumno;
  i:rango;
  cont:vector;
begin
  for i:= 18 to 60 do
    cont[i] := 0;
  leeralumno(al);
  while (al.nombre <> 'ZZZ') do begin
    cont[al.edad]:= cont[al.edad] + 1;
    leeralumno(al);
    end;
  for i:= 18 to 60 do
    writeln('Con edad igual a ',i,' hay ',cont[i],' alumnos.');
  writeln('Presione ENTER para finalizar');
  readln;
end.
