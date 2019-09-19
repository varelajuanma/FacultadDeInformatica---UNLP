Program ejer1prac12;
type
  lista = ^nodo;
  nodo = record
       dato:integer;
       ant:lista;
       sig:lista;
       end;
  ld = record
       pri:lista;
       ult:lista;
       end;

procedure agregarAtras (ID:integer; var l:ld);
  var
    nuevo:lista;
  begin
    new(nuevo);
    nuevo^.dato:= ID;
    nuevo^.ant:= nil;
    nuevo^.sig:= nil;
    if (l.pri = nil) then begin
      l.pri:= nuevo;
      l.ult:= nuevo;
      end
    else
      l.ult^.sig:= nuevo;
      nuevo^.ant:= l.ult;
      l.ult:= nuevo;
  end;

procedure agregarAdelanteMedioAtras (ID:integer; var l:ld);
  var
    ant,act,nuevo:lista;
  begin
    act:= l.pri;
    new(nuevo);
    nuevo^.dato:= ID;
    nuevo^.sig:= nil;
    nuevo^.ant:= nil;
    while (act <> nil) and (ID > act^.dato) do begin
      ant:= act;
      act:= act^.sig;
      end;
    if (act = l.pri) then begin  {agrega primero}
      nuevo^.sig:= l.pri;
      l.pri:= nuevo;
      end
    else
      ant^.sig:= nuevo;        {agrega en el medio o en el final}
      nuevo^.sig:= act;
  end;

procedure cargar (var l:ld);
  var
    ID:integer;
  begin
    l.pri:= nil;
    l.ult:= nil;
    write ('Ingrese un numero a agregar: ');
    readln (ID);
    while (ID <> 999) do begin
      agregarAtras(ID,l);
      agregarAdelanteMedioAtras(ID,l);
      write ('Ingrese un numero a agregar: ');
      readln (ID);
      end;
  end;

procedure recorrerAscendente (l:ld);
  begin
    while (l.pri <> nil) do begin
      writeln(l.pri^.dato);
      l.pri:= l.pri^.sig;
      end;
  end;

procedure recorrerDescendente (l:ld);
  begin
    while (l.ult <> nil) do begin
      writeln(l.ult^.dato);
      l.ult:= l.ult^.ant;
      end;
  end;

var
  l:ld;
begin
  cargar(l);
  recorrerAscendente(l);
  recorrerDescendente(l);
  writeln('Presione ENTER para finalizar');
  readln;
end.
