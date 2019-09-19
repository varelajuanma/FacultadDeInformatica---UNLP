Program ejer5prac10;
type
  cadena = string [50];
  avion = record
        marca:cadena;
        modelo:cadena;
        valor:real;
        end;
  lisavion = ^nodo;
  nodo = record
        datos:avion;
        sig:lisavion;
        end;

procedure pedido (l1:lisavion; var reg:avion; var cumple:boolean);
  var
    ant,act:lisavion;
  begin
    ant:= l1;
    act:= l1;
    while (act <> nil) and (act^.datos.marca <= reg.marca) and (cumple = false) do begin
      if (act^.datos.modelo = reg.modelo) and (act^.datos.valor = reg.valor) then begin
        cumple := true;
        end
      else
        ant:= act;
        act:= act^.sig;
      end;
    if (act <> nil) and (cumple = true) then begin
      if (act = l1) then begin
        l1:= act^.sig;
        end
      else
        ant^.sig:= act^.sig;
      dispose (act);
      end;
  end;

var
  l1:lisavion;
  reg:avion;
  cumple:boolean;
begin
  cumple:= false;
  pedido (l1,reg,cumple);
  if (cumple = true) then begin
    writeln('Se encontro el elemento pedido para eliminar');
    end
  else
    writeln('No se pudo encontrar el elemento pedido para eliminar');
  writeln('Presione ENTER para finalizar');
  readln;
end.
