Program ejer2pracRepaso;
type
  fecha1 = record
         dia:integer;
         mes:integer;
         anio:integer;
         end;
  venta = record
         codigo:integer;
         cantven:integer;
         fecha:fecha1;
         nrocliente:integer;
         monto:real;
         end;
  lista = ^nodol;
  nodol = record
         dato:venta;
         sig:lista;
         end;
  registro = record
         codigo:integer;
         stockactual:integer;
         stockminimo:integer;
         end;
  arbol = ^nodoa;
  nodoa = record
         dato:registro;
         hijoizq:arbol;
         hijoder:arbol;
         end;
  registro2 = record
         codigo:integer;
         montototal:real;
         end;
  arbol2 = ^nodoa2;
  nodoa2 = record
         dato:registro2;
         hijoizq:arbol2;
         hijoder:arbol2;
         end;

function buscar (a:arbol; cod:integer):arbol;
  begin
    if (a = nil) then begin
      buscar:= nil;
      end
    else
      if (cod = a^.dato.codigo) then begin
        buscar:= a;
        end
      else
        if (cod < a^.dato.codigo) then begin
          buscar:= buscar(a^.hijoizq,cod);
          end
        else
          buscar:= buscar(a^.hijoder,cod);
  end;

procedure incisoA (l:lista; var a:arbol);
  var
    aux:arbol;
    auxcod:integer;
  begin
    auxcod:= l^.dato.codigo;
    aux:= buscar (a,auxcod);
    if (aux <> nil) then
      if (aux^.dato.stockactual < aux^.dato.stockminimo) then
        aux^.dato.stockactual:= aux^.dato.stockactual + (aux^.dato.stockminimo - aux^.dato.stockactual);
  end;

procedure insertar (var a2:arbol2; codigo:integer; montototal:real);
  begin
    if (a2 = nil) then begin
      new (a2);
      a2^.dato.codigo:= codigo;
      a2^.dato.montototal:= montototal;
      a2^.hijoizq:= nil;
      a2^.hijoder:= nil;
      end
    else
      if (codigo = a2^.dato.codigo) then begin
        a2^.dato.montototal:= a2^.dato.montototal + montototal;
        end
      else
        if (codigo < a2^.dato.codigo) then begin
          insertar (a2^.hijoizq,codigo,montototal);
          end
        else
          insertar (a2^.hijoder,codigo,montototal);
  end;

procedure incisoB (a2:arbol2);
  begin
    if (a2 <> nil) then begin
      writeln ('Monto total de codigo ',a2^.dato.codigo,'es: ',a2^.dato.montototal);
      incisoB (a2^.hijoizq);
      incisoB (a2^.hijoder);
      end;
  end;

procedure incisoC (a:arbol; var maxcod,max:integer);
  begin
    if (a <> nil) then
      if (a^.dato.codigo > 10) then begin
        if (a^.dato.codigo < 50) then begin
          if (a^.dato.stockactual > max) then begin
            max:= a^.dato.stockactual;
            maxcod:= a^.dato.codigo;
            end;
          incisoC (a^.hijoizq,maxcod,max);
          incisoC (a^.hijoder,maxcod,max);
          end
        else
          incisoC (a^.hijoder,maxcod,max);
        end;
  end;

var
  l:lista;
  a:arbol;
  a2:arbol2;
  codigo,maxcod,max:integer;
  montototal:real;
begin
  a2:= nil;
  max:= -1;
  montototal:= 0;
  while (l <> nil) do begin
    codigo:= l^.dato.codigo;
    incisoA (l,a);
    if (codigo = l^.dato.codigo) then begin
      montototal:= montototal + l^.dato.monto;
      end
    else
      insertar (a2,codigo,montototal);
    l:= l^.sig;
    end;
  writeln ('MONTO TOTAL RECAUDADO POR CODIGO DE PRODUCTO');
  incisoB (a2);
  incisoC (a,maxcod,max);
  writeln ('El codigo del producto con mayor stock actual entre aquellos productos cuyo codigo de producto se encuentre entre 10 y 50 es: ',maxcod);
  writeln ('Presione ENTER para finalizar');
  readln;
end.
