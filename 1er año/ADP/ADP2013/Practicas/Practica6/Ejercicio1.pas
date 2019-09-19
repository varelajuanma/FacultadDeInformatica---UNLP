Program ejer1;
type
  cadena = string [50];
  inmueble = record
            tipo: cadena;          {duplex, casa o departamento}
            direccion: cadena;
            canthab: integer;
            cochera: cadena;       {si tiene o no tiene}
            condicion: cadena;     {venta o alquiler}
            precio: real;
            end;
procedure leerinmueble (var inm:inmueble);
  begin
    write('Ingrese direccion del inmueble: ');
    readln(inm.direccion);
    if (inm.direccion <> 'ZZZ') then begin
      write('Ingrese el tipo de inmueble: ');
      readln(inm.tipo);
      write('Ingrese la cantidad de habitaciones: ');
      readln(inm.canthab);
      write('Ingrese si tiene o no tiene cochera: ');
      readln(inm.cochera);
      write('ingrese si esta en venta o alquiler: ');
      readln(inm.condicion);
      write('Ingrese el precio: ');
      readln(inm.precio);
      end;
  end;
procedure incisoA (var inm:inmueble);
  begin
    if (inm.tipo = 'casa') and (inm.canthab = 2) then
      writeln('El inmueble ubicado en ',inm.direccion,' es una casa con 2 habitaciones.');
  end;
procedure incisoB (var inm:inmueble; var preprom:real);
  begin
    if (inm.condicion = 'alquiler') and (inm.canthab = 3) and (inm.cochera = 'si tiene') then
      preprom:= preprom + inm.precio;
  end;
procedure incisoC (var inm:inmueble; var totalinm,totalven:integer);
  begin
    totalinm:= totalinm + 1;
    if (inm.condicion = 'venta') then
      totalven:= totalven + 1;
  end;
var
  inm: inmueble;
  preprom: real;
  totalinm, totalven: integer;
begin
  preprom:= 0;
  totalinm:= 0;
  totalven:= 0;
  leerinmueble (inm);
  while (inm.direccion <> 'ZZZ') do begin
    incisoA(inm);
    incisoB(inm, preprom);
    incisoC(inm, totalinm, totalven);
    leerinmueble(inm);
    end;
  writeln('El precio promedio de alquiler de los departamentos con 3 habitacion y cochera es: ',preprom);
  writeln('El porcentaje de inmuebles en ventas es: ',totalven DIV totalinm);
  writeln('Presione ENTER para finalizar');
  readln;
end.
