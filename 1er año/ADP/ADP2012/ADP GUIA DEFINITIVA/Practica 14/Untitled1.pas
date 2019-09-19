program Ejercicio1;
type
  lista = ^nodo;
  nodo = record
    dato:integer;
    ant:lista;
    sig:lista;
  end;

  LD = record
    pri:lista;
    ult:lista;
  end;

procedure agregarAtras(id:integer; var l:LD);
var
  nuevo:lista;
begin
  new(nuevo);
  nuevo^.dato:=id;
  nuevo^.ant:=nil;
  nuevo^.sig:=nil;
  if (l.pri=nil) then
    begin
      l.pri:=nuevo;
      l.ult:=nuevo;
    end
  else
    begin
      l.ult^.sig:=nuevo;
      nuevo^.ant:=l.ult;
      l.ult:=nuevo;
    end;
end;

procedure agregarAdelanteMedioAtras(id:integer; var l:LD);
var
  ant, act, nuevo: lista;
begin
  act:= l.pri;
  new(nuevo);
  nuevo^.dato:=id;
  nuevo^.sig:=nil;
  nuevo^.ant:=nil;
  while (act <> nil) and (id > act^.dato) do
  begin
    ant:= act;
    act:= act^.sig;
  end;
  if (act = l.pri) then begin {agrega primero}
    nuevo^.sig:= l.pri;
    l.pri := nuevo;
  end
  else begin                  {es en el medio o al final}
    ant^.sig := nuevo;
    nuevo^.sig := act;
  end;	 
end;


procedure cargar(var L:LD);
var
  id:integer;
begin
  l.pri:=nil;
  l.ult:=nil;
  readln(id);
  while (id <> 999) do
    begin
      //agregarAtras(id,L); o agregarAdelanteMedioAtras(id,L);
      //      depende si te lo dan ordenado o no.
      readln(id);
    end;
end;


procedure recorrerAscendente(l:LD);
begin
  while (l.pri<>nil) do
    begin
      writeln(l.pri^.dato);
      l.pri:=l.pri^.sig;
    end;
end;

procedure recorrerDescendente(l:LD);
begin
  while (l.ult<>nil) do
    begin
      writeln(l.ult^.dato);
      l.ult:=l.ult^.ant;
    end;
end;

//Programa principal

var
  l:LD;
begin
  cargar(L);
  recorrerAscendente(L);
  recorrerDescendente(L);
  readln();
  readln();
end.

