Program ejer1prac13B;
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
        insertar (a^.hijoizq,num);
        end
      else
        insertar (a^.hijoder,num);
  end;

procedure incisoA (a:arbol);
  begin
    if (a <> nil) then begin
      incisoA (a^.hijoder);
      writeln (a^.dato);
      incisoA (a^.hijoizq);
      end;
  end;

procedure incisoB (a:arbol);
  begin
    if (a <> nil) then begin
      incisoB (a^.hijoizq);
      if (a^.dato MOD 2 = 0) then
        writeln (a^.dato);
      incisoB (a^.hijoder);
      end;
  end;

procedure incisoC (a:arbol; var cant:integer);
  begin
    if (a <> nil) then begin
      cant:= cant + 1;
      incisoC (a^.hijoizq,cant);
      incisoC (a^.hijoder,cant);
      end;
  end;

var
  a:arbol;
  num,cant:integer;
begin
  a:= nil;
  cant:= 0;
  writeln ('------GENERAR ARBOL------');
  write ('Ingrese un numero a insertar: ');
  readln (num);
  while (num <> 0) do begin
    insertar (a,num);
    write ('Ingrese un numero a insertar: ');
    readln(num);
    end;
  writeln ('------ORDEN DECRECIENTE------');
  incisoA (a);
  writeln ('------ORDEN CRECIENTE SOLO NUMEROS PARES------');
  incisoB (a);
  writeln ('---------------------------');
  incisoC (a,cant);
  writeln ('La cantidad total de elementos en el arbol es: ',cant);
  writeln ('Presione ENTER para finalizar');
  readln;
end.
