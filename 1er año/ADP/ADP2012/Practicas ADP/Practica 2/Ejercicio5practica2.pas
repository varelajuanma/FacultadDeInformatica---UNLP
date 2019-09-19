Program ejer5prac2;
var
  codigo:integer;
  duracion:integer;
  cantalumnos:integer;
  maxalumnos:integer;
  promedio:real;
  c:integer;
  d:integer;
  maxpromedio:real;
  carreramayor:integer;
begin
  maxpromedio:=0;
  carreramayor:=0;
  for c:=1 to 8 do begin
    maxalumnos:=0;
    cantalumnos:=0;
    promedio:=0;
    writeln('ingrese el codigo de una de las ocho carreras');
    readln(codigo);
    writeln('ingrese la duracion total de la carrera');
    readln(duracion);
    for d:=1 to duracion do begin
      writeln('ingrese la cantidad de alumnos en el ',d,' año.');
      readln(cantalumnos);
      maxalumnos:=maxalumnos + cantalumnos;
    end;
    promedio:=maxalumnos div duracion;
    if (promedio > maxpromedio) then begin
      maxpromedio:=promedio;
      carreramayor:=c;
    end;
  end;
  writeln('la carrera que tiene la mayor cantidad promedio de alumnos es la: ',carreramayor);
  readln;
  readln;
end.
