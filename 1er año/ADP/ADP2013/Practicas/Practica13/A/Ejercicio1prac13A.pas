Program ejer1prac13A;
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
      if (num = a^.dato) then begin
        writeln ('NUMERO REPETIDO');
        end
      else
        if (num < a^.dato) then begin
          insertar (a^.hijoizq,num);
          end
        else
          insertar (a^.hijoder,num);
  end;

procedure recorrido (a:arbol);
  begin
    if (a <> nil) then begin
      recorrido (a^.hijoizq);
      writeln (a^.dato);
      recorrido (a^.hijoder);
      end;
  end;

var
  a:arbol;
  num:integer;
begin
  a:= nil;
  write('Ingrese un numero: ');
  readln(num);
  while (num <> -1) do begin
    insertar (a,num);
    write('Ingrese un numero: ');
    readln(num);
    end;
  recorrido (a);
  writeln('Presione ENTER para finalizar');
  readln;
end.
