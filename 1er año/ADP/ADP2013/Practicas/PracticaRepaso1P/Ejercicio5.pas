Program ejer5;
type
  cadena30 = string [30];
  rango = 1 .. 10;
  inscripto = record
            apellido:cadena30;
            nombre:cadena30;
            DNI:integer;
            edad:integer;
            curso:rango;
            end;
  vectorinscriptos = array [rango] of integer;

procedure iniciarvectorinscriptos (var v:vectorinscriptos);
  var
    i:integer;
  begin
    for i:= 1 to 10 do
      v[i]:= 0;
  end;

procedure leerinscripto (var ins:inscripto);
  begin
    with ins do begin
      write('Ingrese el apellido: ');
      readln(apellido);
      if (apellido <> 'ZZZ') then begin
        write('Ingrese el nombre: ');
        readln(nombre);
        write('Ingrese el DNI: ');
        readln(DNI);
        write('Ingrese la edad: ');
        readln(edad);
        write('Ingrese el codigo del curso: ');
        readln(curso);
        end;
      end;
  end;

procedure cargarvectorinscriptos (var v,cupomax:vectorinscriptos);
  var
    ins:inscripto;
    cod:integer;
  begin
    leerinscripto (ins);
    while (ins.apellido <> 'ZZZ') do begin
      cod:= ins.curso;
      if (v[cod] < cupomax[cod]) then begin
        v[cod]:= v[cod] + 1;
        end
      else
        writeln('No hay mas lugar disponible en el curso ',cod);
      leerinscripto (ins);
      end;
  end;

procedure incisoC (var v:vectorinscriptos; var codmin1,codmin2:integer; i,min1,min2:integer);
  begin
    if (v[i] < min1) then begin
      min1:= v[i];
      codmin1:= i;
      min2:= min1;
      codmin2:= codmin1;
      end
    else
      if (v[i] < min2) then begin
        min2:= v[i];
        codmin2:= i;
        end;
  end;

var
  min1,min2,i,codmin1,codmin2:integer;
  v,cupomax:vectorinscriptos;
begin
  min1:= 999;
  min2:= 999;
  iniciarvectorinscriptos (v);
  cargarvectorinscriptos (v,cupomax);
  for i:= 1 to 10 do begin
    if (v[i] < cupomax[i]) then
      writeln('El curso ',i,' no se completo');
    incisoC (v,codmin1,codmin2,i,min1,min2);
    end;
  writeln('El curso con menos inscripciones es: ',codmin1);
  writeln('El segundo curso con menos inscripciones es: ',codmin2);
  writeln('Presione ENTER para finalizar');
  readln;
end.
