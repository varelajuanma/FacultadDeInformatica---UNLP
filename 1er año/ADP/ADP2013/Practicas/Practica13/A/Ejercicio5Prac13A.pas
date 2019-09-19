Program ejer5prac13A;
type
  cadena=string[30];
  vehiculo=record
          patente:cadena;
          marca:cadena;
          anio:integer;
          color:cadena;
          end;
  arbol = ^nodoarbol;
  nodoarbol=record
          dato:vehiculo;
          izq:arbol;
          der:arbol;
          end;
  lista=^nodolista;
  nodolista=record
          dato:vehiculo;
          sig:lista;
          end;

procedure cargar (var l:lista; veh:vehiculo);
  var
     nuevo:lista;
  begin
    new(nuevo);
    nuevo^.dato:=veh;
    nuevo^.sig:=nil;
    while (l <> nil) do begin
      l:=l^.sig;
      end;
    l:=nuevo;
  end;

procedure recorrer(a:arbol; var l:lista);
  begin
       if (a <> nil) then begin
          if (a^.dato.anio >= 2010) and (a^.dato.anio <= 2013) then
            cargar(l,a^.dato);
          recorrer(a^.izq,l);
          recorrer(a^.der,l);
          end;
  end;

procedure incisoA(l:lista; var porcentaje:real);
  var
    cant:integer;
    total:integer;
  begin
    cant:=0;
    total:=0;
    while (l <> nil) do begin
      if (l^.dato.color = 'gris') then
        cant:= cant + 1;
      total:= total + 1;
      l:=l^.sig;
      end;
    porcentaje:= (cant*100) DIV total;
  end;

procedure incisoB(a:arbol; var cant:integer; var total:integer);
  begin
    if (a <> nil) then begin
      if (a^.dato.patente >= 'HAA000') then begin
        if (a^.dato.color = 'gris') then
          cant:=cant + 1;
        total:=total + 1;
        incisoB(a^.izq,cant,total);
        incisoB(a^.der,cant,total);
        end
      else
        incisoB(a^.der,cant,total);
      end;
  end;

var
  a:arbol;
  l:lista;
  cant,total:integer;
  porcentaje:real;
begin
  l:=nil;
  cant:=0;
  total:=0;
  writeln('Cargar modelos de vehiculos mayores a 2010 y menores a 2013 en la lista');
  recorrer(a,l);
  incisoA(l,porcentaje);
  writeln('El porcentaje de vehiculos de color "gris" modelos mayores a 2010 y menores a 2013 es: ',porcentaje);
  incisoB(a,cant,total);
  porcentaje:=(cant*100) DIV total;
  writeln('El porcentaje de vehiculos de color "gris" con patente mayor a "HAA000" es: ',porcentaje);
  writeln('Presione ENTER para finalizar');
  readln;
end.
