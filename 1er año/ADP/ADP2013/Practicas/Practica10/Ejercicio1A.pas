Program ejer1a;
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
var
  pri:lista;
  num:integer;
begin
  pri:= nil;
  write('Ingrese un numero: ');
  readln(num);
  while (num <> 999) do begin
    agregaradelante(pri,num);
    write('Ingrese un numero: ');
    readln(num);
    end;
  writeln('Presione ENTER para finalizar');
  readln;
end.
