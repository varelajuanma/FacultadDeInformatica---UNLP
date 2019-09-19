program Ejercicio3;
type

  lista= ^nodo;
  nodo = record
    jugador:string[20];
    sig:lista;
    ant:lista;
  end;
procedure agregar(jug:nodo ;var l:lista;var ult:lista);
var
  nuevo:lista;
begin
  new(nuevo);
  nuevo^.jugador:=jug.jugador;
  nuevo^.sig:=nil;
  nuevo^.ant:=nil;
  if (l=nil) then l:=nuevo
  else
    begin
      ult^.sig:=nuevo;
      nuevo^.ant:=ult;
      ult:=nuevo;
    end;
end;
procedure  cargar(var l:lista);
var
  jug:nodo;
  ult:lista;
begin
  read(jug.jugador);
  while (jug.jugador <> '999') do
    begin
      agregar(jug,l,ult);
      read(jug.jugador);
    end;
end;

procedure eliminar(ant:lista; var l:lista);
begin
  ant^.sig:=l^.sig;
  l^.ant:=ant;
  l:=ant;
end;

procedure jugar(var l:lista);
var
  i:integer;
  ant:lista;
begin
  while (l^.sig <> l)do
    begin
       for i:=1 to tirardados() do
         begin
         ant:=l^.ant;
         l:=l^.sig;
         end;
       eliminar(ant,l);
    end;
  writeln('El ganador es ',l^.jugador);
end;

// Programa Principal

var
  l: lista;
begin
  cargar(l);
  jugar(l);
  readln();
  readln();
end.
