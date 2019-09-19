Program ejer3prac12;
type
  lista = ^nodo;
  nodo = record
       jugador:integer;
       sig:lista;
       ant:lista;
       end;

procedure agregar (jug:nodo; var lis,ult:lista);
  var
    nue:lista;
  begin
    new (nue);
    nue^.jugador:= jug.jugador;
    nue^.sig:= nil;
    nue^.ant:= nil;
    if (lis = nil) then begin
      lis:= nue;
      end
    else
      ult^.sig:= nue;
      nue^.ant:= ult;
      ult:= nue;
  end;

procedure cargar (var lis:lista);
  var
    jug:nodo;
    ult:lista;
  begin
    write('Ingrese numero de jugador');
    readln(jug.jugador);
    while (jug.jugador <> 999) do begin
      agregar (jug,lis,ult);
      writeln('Ingrese numero de jugador');
      readln(jug.jugador);
      end;
  end;

procedure eliminar (ant:lista; var lis:lista);
  begin
    ant^.sig:= lis^.sig;
    lis^.ant:= ant;
    lis:= ant;
  end;

procedure jugar (var lis:lista);
  var
    i:integer;
    ant:lista;
  begin
    while (lis^.sig <> lis) do begin
      for i:=1 to tirardado() do begin
        ant:= lis^.ant;
        lis:= lis^.sig;
        end;
      eliminar (ant,lis);
      end;
    writeln ('El ganador del juego fue el jugador: ',lis^.jugador);
  end;

var
  lis:lista;
begin
  cargar (lis);
  jugar (lis);
  writeln ('Presione ENTER para finalizar');
  readln;
end.
