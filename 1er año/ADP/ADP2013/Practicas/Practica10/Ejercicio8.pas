Program ejer8;
type
  cadena = string [50];
  paquetetur = record
             codigo:integer;
             nombre:cadena;
             precio:real;
             end;
  listap = ^nodo;
  nodo = record
             datos:paquetetur;
             sig:listap;
             end;
  provincia = record
             nombre:cadena;
             infop:listap;
             end;
  listaprov = ^nodo2;
  nodo2 = record
             datos:provincia;
             sig:listaprov;
             end;

procedure incisoA (list:listaprov; var maxcod:integer);
  var
    maxcosto:real;
  begin
    maxcosto:= 0;
    while (list^.datos.infop^.sig <> nil) do begin
      if (list^.datos.infop^.datos.precio > maxcosto) then begin
        maxcosto:= list^.datos.infop^.datos.precio;
        maxcod:= list^.datos.infop^.datos.codigo;
        end;
      list^.datos.infop:= list^.datos.infop^.sig;
      end;
  end;
procedure incisoB (list:listaprov; var nom1,nom2:cadena; var min1,min2:integer);
  var
    cont:integer;
  begin
    cont:= 0;
    while (list^.datos.infop^.sig <> nil) do begin
      cont:= cont + 1;
      list^.datos.infop:= list^.datos.infop^.sig;
      end;
    if (cont < min1) then begin
      min2:= min1;
      nom2:= nom1;
      min1:= cont;
      nom1:= list^.datos.infop^.datos.nombre;
      end
    else
      if (cont < min2) then begin
        min2:= cont;
        nom2:= list^.datos.infop^.datos.nombre;
        end;
  end;

var
  list:listaprov;
  maxcod,min1,min2:integer;
  nom1,nom2:cadena;
begin
  min1:= 999;
  min2:= 999;
  while (list <> nil) do begin
    incisoA (list,maxcod);
    incisoB (list,nom1,nom2,min1,min2);
    writeln('El codigo .... ',maxcod);
    list:= list^.sig;
    end;
  writeln('....',nom1,'...',min1);
  writeln('....',nom2,'...',min2);
  writeln('Presione ENTER para finalizar');
  readln;
end.
