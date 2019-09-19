Program ejer1b;
type
  lista = ^nodo;
  nodo = record
       datos:integer;
       sig:lista;
       end;

procedure agregaradelante (var pri:lista; num:integer);
  var
    aux:lista;
  begin
    new(aux);
    aux^.datos:= num;
    aux^.sig:= pri;
    pri:= aux;
  end;

procedure longitudlista (pri:lista; var cont:integer);
  begin
    while (pri <> nil) do begin
      cont:= cont + 1;
      pri:= pri^.sig;
      end;
  end;

var
  pri:lista;
  num,cont:integer;
begin
  cont:= 0;
  pri:= nil;
  write('Ingrese un numero: ');
  readln(num);
  while (num <> 999) do begin
    agregaradelante(pri,num);
    write('Ingrese un numero: ');
    readln(num);
    end;
  longitudlista (pri,cont);
  writeln('La longitud de la lista es de: ',cont);
  writeln('Presione ENTER para finalizar');
  readln;
end.
