Program ejer6;
type
  rango = 1 .. 10;
  vector = array [rango] of integer;
  venta = record
        codigo:rango;
        monto:integer;
        end;

procedure inicializarvector (var v:vector);
  var
    i:integer;
  begin
    for i:= 1 to 10 do
      v[i]:= 0;
  end;

procedure leerventa (var ven:venta);
  begin
    write('Ingrese el codigo de la venta: ');
    readln(ven.codigo);
    if (ven.codigo <> 0) then begin
      write('Ingrese el monto del producto: ');
      readln(ven.monto);
      end;
  end;

procedure informarventas (var v:vector);
  var
    nroventa,maxmonto,i:integer;
  begin
    maxmonto:= -1;
    for i:= 1 to 10 do begin
      if (v[i] > maxmonto) then begin
        maxmonto:= v[i];
        nroventa:= i;
        end;
      writeln('El monto total vendido del producto codigo N° ',i,' es: ',v[i]);
      end;
    writeln('El codigo de producto que mas recaudo es el ',nroventa,' con ',maxmonto,' pesos');
  end;

var
  v:vector;
  ven:venta;
  pos:integer;
begin
  inicializarvector (v);
  leerventa (ven);
  while (ven.codigo <> 0) do begin
    pos:= ven.codigo;
    v[pos]:= v[pos] + ven.monto;
    leerventa (ven);
    end;
  informarventas (v);
  writeln('Presione ENTER para finalizar');
  readln;
end.
