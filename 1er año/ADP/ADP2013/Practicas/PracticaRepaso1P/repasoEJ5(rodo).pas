program repasoEJ5;
type
    cadena=string[15];
    cursos=1..10;
    registro=record
                   nombre:cadena;
                   apellido:cadena;
                   edad:integer;
                   dni:integer;
                   codigo:cursos;
             end;
    vector=array[cursos]of integer;
procedure leer(var alumno:registro);
begin
     with alumno do
     begin
          writeln('ingrese apellido');
          readln(apellido);
          if (apellido <> 'zzz') then
          begin
               writeln('ingrese nombre');
               readln(nombre);
               writeln('ingrese edad');
               readln(edad);
               writeln('ingrese dni');
               readln(edad);
               writeln('ingrese codigo');
               readln(codigo);
          end;
     end;
end;
procedure iniciar(var contador:vector);
var
   i:integer;
begin
     for i:=1 to 10 do
     begin
          contador[i]:=0;
     end;
end;
procedure sumar(var contador:vector; var cupomax:vector; alumno:registro);
var
   pos:integer;
begin
     pos:=alumno.codigo;
     if (contador[pos] < cupomax[pos]) then
     begin
          contador[pos]:=contador[pos] + 1;
          end
          else
          writeln('no hay lugar disponible en el curso: ',pos);
end;
procedure informar(var contador:vector; var cupomax:vector);
var
   i:integer;
begin
     for i:=1 to 10 do
     begin
          if (contador[i] < cupomax[i]) then
             writeln('el curso: ',i,' no completo su cupo maximo');
     end;
end;
procedure minimos(var contador:vector; var min1:integer; var min2:integer);
var
   cantmin1:integer;
   cantmin2:integer;
   i:integer;
begin
     cantmin1:=999;
     cantmin2:=999;
     for i:=1 to 10 do
     begin
          if (contador[i] < cantmin1) then
          begin
               cantmin2:=cantmin1;
               min2:=min1;
               cantmin1:=contador[i];
               min1:=i;
               end
               else
               if (contador[i] < cantmin2) then
               begin
                    cantmin2:=contador[i];
                    min2:=i;
               end;
     end;
end;
var
   contador:vector;
   cupomax:vector;
   alumno:registro;
   min1:integer;
   min2:integer;
begin
     iniciar(contador);
     writeln('ingrese alumno');
     leer(alumno);
     while (alumno.apellido <> 'zzz') do
     begin
          sumar(contador,cupomax,alumno);
          writeln('ingrese otro alumno');
          leer(alumno);
     end;
     informar(contador,cupomax);
     minimos(contador,min1,min2);
     writeln('el curso con menos alumnos inscriptos es: ',min1);
     writeln('el curso con segunda menor cantidad de inscriptos es: ',min2);
     writeln('ingrese ENTER para finalizar');
     readln;
end.
