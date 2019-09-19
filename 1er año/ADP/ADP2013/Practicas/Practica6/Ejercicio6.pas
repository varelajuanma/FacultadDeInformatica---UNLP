Program ejer6;
type
  sitio = record
        nombre:string [30];
        provincia:string [30];
        visitantes:integer;
        end;

procedure leersitio (var sit:sitio);
  begin
    with sit do begin
      write('Ingrese el nombre del sitio: ');
      readln(nombre);
      if (nombre <> 'ZZZ') then begin
        write('Ingrese la provincia donde se encuentra el sitio: ');
        readln(provincia);
        write('Ingrese la cantidad de visitantes en el sitio: ');
        readln(visitantes);
        end;
      end;
  end;

var
  sit:sitio;
  snum,cantvisit:integer;
begin
  cantvisit:= 0;
  snum:= 0;
  leersitio(sit);
  while (sit.nombre <> 'ZZZ') do begin
    snum:= snum + 1;
    writeln('Nombre del sitio ',snum,': ',sit.nombre);
    writeln('Cantidad de visitantes: ',sit.visitantes);
    cantvisit:= cantvisit + sit.visitantes;
    leersitio(sit);
    end;
  writeln('Total general de visitantes: ',cantvisit);
  writeln('Presione ENTER para finalizar');
  readln;
end.
