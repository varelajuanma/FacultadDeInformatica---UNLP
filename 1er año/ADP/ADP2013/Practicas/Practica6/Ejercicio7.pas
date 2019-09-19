Program ejer7;
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
  prov:string[30];
  pnum,snum,totalprov,totalgral:integer;
begin
  totalgral:= 0;
  pnum:= 0;
  leersitio (sit);
  while (sit.nombre <> 'ZZZ') do begin
    snum:= 0;
    totalprov:=0;
    pnum:= pnum + 1;
    prov:= sit.provincia;
    writeln('PROVINCIA ',pnum,': ',sit.provincia);
    while (sit.provincia = prov) and (sit.nombre <> 'ZZZ') do begin
      snum:= snum + 1;
      writeln('Sitio ',snum,': ',sit.nombre);
      writeln('Cant visit sitio ',snum,': ',sit.visitantes);
      totalprov:= totalprov + sit.visitantes;
      leersitio (sit);
      end;
    totalgral:= totalgral + totalprov;
    writeln('TOTAL PROVINCIA ',pnum,': ',totalprov);
    end;
  writeln('TOTAL GENERAL DE VISITANTES: ',totalgral);
  writeln('Presione ENTER para finalizar');
  readln;
end.

end.
