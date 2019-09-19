Program ejer1;
type
  cadena30 = string [30];
  rango = 1 .. 10000;
  producto = record
           codigo:integer;
           descripcion:cadena30;
           stockactual:integer;
           stockminimo:integer;
           precio:integer;
           end;
  vector = array [rango] of producto;
  vector1 = array [rango] of producto;

procedure leerproducto (var prod:producto);
  begin
    with prod do begin
      write('Ingrese el codigo del producto: ');
      readln(codigo);
      write('Ingrese la descripcion del producto: ');
      readln(descripcion);
      write('Ingrese el stock actual del producto: ');
      readln(stockactual);
      write('Ingrese el stock minimo del producto: ');
      readln(stockminimo);
      write('Ingrese el precio del producto: ');
      readln(precio);
      end;
  end;

procedure incisoA (var prod:producto; var cod1,cod2:integer);
  var
    min1,min2:integer;
  begin
    min1:= 9999;
    min2:= 9999;
    if (prod.precio < min1) then begin
      min1:= prod.precio;
      cod1:= prod.codigo;
      min2:= min1;
      cod2:= cod1;
      end
    else
      if (prod.precio < min2) then begin
        min2:= prod.precio;
        cod2:= prod.codigo;
        end;
  end;

procedure incisoB (var prod:producto; var v1:vector1; var dimL:integer);
  begin
    if (prod.stockactual < prod.stockminimo) then begin
      v1[dimL]:= prod;
      dimL:= dimL + 1;
      end;
  end;

var
  prod:producto;
  v:vector;
  v1:vector1;
  cod1,cod2,dimL,j,i:integer;
begin
  dimL:= 1;
  for i:= 1 to 3 do begin
    writeln('PRODUCTO');
    leerproducto (prod);
    v[i]:= prod;
    incisoA (prod,cod1,cod2);
    incisoB (prod,v1,dimL);
    end;
  writeln('El codigo del primer producto con menor precio es: ',cod1);
  writeln('El codigo del segundo producto con menor precio es: ',cod2);
  for j:= 1 to dimL do
    writeln('Producto: ',prod.codigo);
  writeln('Presione ENTER para finalizar');
  readln;
end.
