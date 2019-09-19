Program ejer1c;
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

procedure longitudlista (pri:lista; var long:integer);
  begin
    while (pri <> nil) do begin
      long:= long + 1;
      pri:= pri^.sig;
      end;
  end;

procedure tresdigpares (pri:lista; var suma:integer);
  var
    cantdig,dig,n:integer;
  begin
    while (pri <> nil) do begin
      cantdig:= 0;
      n:= pri^.datos;
      while (n <> 0) do begin
        dig:= n MOD 10;
        if ((dig MOD 2) = 0) then
          cantdig:= cantdig + 1;
        n:= n DIV 10;
        end;
      if (cantdig = 3) then
        suma:= suma + 1;
      pri:= pri^.sig;
      end;
  end;

var
  pri:lista;
  num,long,suma:integer;
begin
  suma:= 0;
  long:= 0;
  pri:= nil;
  write('Ingrese un numero: ');
  readln(num);
  while (num <> 999) do begin
    agregaradelante(pri,num);
    write('Ingrese un numero: ');
    readln(num);
    end;
  longitudlista (pri,long);
  tresdigpares (pri,suma);
  writeln('La longitud de la lista es de: ',long);
  writeln('La cantidad de numeros con 3 digitos pares es de: ',suma);
  writeln('Presione ENTER para finalizar');
  readln;
end.
