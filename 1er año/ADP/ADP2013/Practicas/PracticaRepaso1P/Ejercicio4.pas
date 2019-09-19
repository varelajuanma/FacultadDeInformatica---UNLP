Program ejer4;
type
  cadena30 = string [30];
  rango = 1 .. 4;
  persona = record
          nombre:cadena30;
          apellido:cadena30;
          servicio:rango;
          monto:real;
          end;
  vectorservicios = array [rango] of real;

procedure iniciarvectorservicios (var v:vectorservicios);
  var
    i:integer;
  begin
    for i:= 1 to 4 do
      v[i]:= 0;
  end;

procedure leerpersona (var per:persona);
  begin
    with per do begin
      write('Ingrese el nombre: ');
      readln(nombre);
      if (nombre <> 'ZZZ') then begin
        write('Ingrese el apellido: ');
        readln(apellido);
        write('Ingrese el codigo de servicio a pagar: ');
        readln(servicio);
        write('Ingrese el monto a pagar: ');
        readln(monto);
        end;
      end;
  end;

var
  v,tabla:vectorservicios;
  per:persona;
  codser,i:integer;
  maxper:cadena30;
  montototal,maxmonto:real;
begin
  maxmonto:= -1;
  maxper:= 'ZZZ';
  iniciarvectorservicios (v);
  leerpersona (per);
  while (per.nombre <> 'ZZZ') do begin
    montototal:= 0;
    codser:= per.servicio;
    montototal:= per.monto + tabla[codser];
    v[codser]:= v[codser] + montototal;
    if (per.servicio = 2) then
      if (per.monto > maxmonto) then begin
        maxmonto:= per.monto;
        maxper:= per.nombre;
        end;
    leerpersona (per);
    end;
  for i:= 1 to 4 do
    writeln('La categoria ',i,' recaudo un total de ',v[i], 'pesos');
  if (maxper = 'ZZZ') then begin
    writeln('Nadie pago servicio de cable categoria 2');
    end
  else
    writeln('La persona que mas pago por la categoria 2 es: ',maxper);
  writeln('Presione ENTER para finalizar');
  readln;
end.
