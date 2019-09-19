{Se lee una sucesion de 100 nombres y notas de alumnos. Informar los nombres y
notas de los alumnos que superan el promedio del grupo.}

Program ejemplo3;
type
  cadena30 = string [30];
  alumno = record
          nombre:cadena30;
          nota:integer;
          end;
  vector = array [1..100] of alumno;

procedure leeralumno (var a:alumno);
  begin
    write('Ingrese el nombre de alumno');
    readln(a.nombre);
    write('Ingrese la nota del alumno');
    readln(a.nota);
  end;

var
  a,notas:alumno;
  v:vector;
  totalnot,i,promedio,pos:integer;
begin
  totalnot:= 0;
  pos:= 1;
  while (pos <= 100) do begin
    leeralumno (a);
    v[pos]:= a;
    totalnot:= totalnot + a.nota;
    pos:= pos + 1;
    end;
  promedio:= totalnot DIV 100;
  pos:= 1;
  while (pos <= 100) do begin
    notas:= v[pos];
    if ( > promedio) then
      writeln('anssa');
    pos:= pos + 1;
    end;
  writeln('Presione ENTER para finalizar');
  readln;
end.
