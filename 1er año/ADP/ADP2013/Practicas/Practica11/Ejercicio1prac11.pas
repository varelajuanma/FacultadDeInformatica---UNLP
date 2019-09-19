Program ejer1prac11;
type
  venta = record
        codprod:integer;
        cantven:integer;
        end;
  lisventas = ^nodo1;
  nodo1 = record
        datos:venta;
        sig:lisventas;
        end;
  total = record
        codprod:integer;
        canttotal:integer;
        end;
  listotal = ^nodo2;
  nodo2 = record
        datos:total;
        sig:listotal;
        end;

procedure minimo (var L1,L2:lisventas; var min:venta);
  begin
    if( L1 = nil) and (L2 = nil) then begin
      min.codprod:= 999;
      end
    else
      if (L1 <> nil) and (L2 <> nil) then begin
        if (L1^.datos.codprod <= L2^.datos.codprod) then begin
          min:= L1^.datos;
          L1:= L1^.sig;
          end
        else
          min:= L2^.datos;
          L2:= L2^.sig;
        end
      else
        if (L2 = nil) then begin
          min:= L1^.datos;
          L1:= L1^.sig;
          end
        else
          min:= L2^.datos;
          L2:= L2^.sig;
  end;
procedure agregaratras (var L3,ult:listotal; prodactual,canttotal:integer);
  var
    nue:listotal;
  begin
    new (nue);
    nue^.sig:= nil;
    nue^.datos.codprod:= prodactual;
    nue^.datos.canttotal:= canttotal;
    if (L3 = nil) then begin
      L3:= nue;
      end
    else
      ult^.sig:= nue;
    ult:= nue;
  end;
procedure totalizar (L1,L2:lisventas; var L3:listotal);
  var
    min:venta;
    prodactual,totalprod:integer;
    ult:listotal;
  begin
    L3:= nil;
    minimo(L1,L2,min);
    while (min.codprod <> 999) do begin
      prodactual:= min.codprod;
      totalprod:= 0;
      while (prodactual = min.codprod) do begin
        totalprod:= totalprod + min.cantven;
        minimo(L1,L2,min);
        end;
      agregaratras(L3,ult,prodactual,totalprod);
      end;
  end;
var
  L1,L2:lisventas;
  min:venta;
  pri,ult,L3:listotal;
  prodactual,canttotal:integer;
begin
  totalizar (L1,L2,L3);
  writeln('Presione ENTER para finalizar');
  readln;
end.
