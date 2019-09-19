Program ejer2;
Type
  cadena30 = string [30];
  examen = record
         nombre:cadena30;
         origen:cadena30;
         puntaje:integer;  {0 a 100}
         end;

Procedure leerexamen (var ex:examen);
  begin
    write('Ingrese nombre del participante: ');
    readln(ex.nombre);
    if (ex.nombre <> 'ZZZ') then begin
      write('Ingrese continente de origen del participante: ');
      readln(ex.origen);
      write('Ingrese puntaje que saco el participante: ');
      readln(ex.puntaje);
      end;
  end;

Procedure mejorcalificacion (var ex:examen; var nmax1,nmax2:cadena30);
  var
    max1,max2:integer;
  begin
    max1:= -1;
    max2:= -1;
    if (ex.puntaje > max1) then begin
      max2:= max1;
      max1:= ex.puntaje;
      nmax2:= nmax1;
      nmax1:= ex.nombre;
      end
    else
      if (ex.puntaje > max2) then begin
        max2:= ex.puntaje;
        nmax2:= ex.nombre;
        end;
  end;

Procedure americanos (var ex:examen; var cantaprob:integer);
  begin
    if (ex.origen = 'americano') then
      if (ex.puntaje > 70) and (ex.puntaje < 90) then
        cantaprob:= cantaprob + 1;
  end;

Procedure europeos (var ex:examen; var total,canteur:integer);
  begin
    if (ex.origen = 'europeo') then begin
      total:= total + 1;
      canteur:= canteur + ex.puntaje;
      end;
  end;

Var
  ex:examen;
  nmax1,nmax2:cadena30;
  cantaprob,total,canteur:integer;
begin
  cantaprob:= 0;
  total:= 0;
  canteur:= 0;
  leerexamen (ex);
  while (ex.nombre <> 'ZZZ') do begin
    mejorcalificacion (ex,nmax1,nmax2);
    if (ex.origen = 'americano') then
      americanos (ex,cantaprob);
    if (ex.origen = 'europeo') then
      europeos (ex,total,canteur);
    leerexamen (ex);
    end;
  writeln('Los nombres de los que obtuvieron las mejores calificaciones son ',nmax1,' y ',nmax2);
  writeln('La cantidad de americanos que aprobaron pero no promocionaron es ',cantaprob);
  writeln('El puntaje promedio de los europeos es: ',canteur DIV total);
  writeln('Presione ENTER para finalizar');
  readln;
end.
