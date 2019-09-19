Program ejer2prac13B;
type
  arbol = ^nodo;
  nodo = record
       dato:integer;
       hijoizq:arbol;
       hijoder:arbol;
       end;

procedure insertar (var a:arbol; num:integer);
  begin
    if (a = nil) then begin
      new (a);
      a^.dato:= num;
      a^.hijoizq:= nil;
      a^.hijoder:= nil;
      end
    else
      if (num < a^.dato) then begin
        insertar (a^.hijoder,num);
        end
      else
        insertar (a^.hijoizq,num);
  end;

procedure generar (a2:arbol; var a:arbol);
  var
    num:integer;
  begin
    if (a2 <> nil) then begin
      generar (a2^.hijoizq,a);
      if (a2^.dato MOD 2 <> 0) then begin
        num:= a2^.dato;
        insertar (a,num);
        end;
      generar (a2^.hijoder,a);
      end;
  end;

var
  a,a2:arbol;
begin
  a:= nil;
  generar (a2,a);
  writeln ('Presione ENTER para finalizar');
  readln;
end.
