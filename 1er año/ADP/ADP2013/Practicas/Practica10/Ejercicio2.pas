Program ejer2;
type
  lista = ^nodo;
  nodo = record
       datos:integer;
       sig:lista;
       end;

procedure agregar (var l:lista; var num:integer);
  var
    aux:lista;
  begin
    new(aux);
    aux^.datos:= num;
    aux^.sig:= l;
    l:= aux;
  end;

procedure cargarl (var l:lista; var num:integer);
  begin
    l:= nil;
    while (num <> 999) do begin
      agregar (l,num);
      write('Ingrese un numero para la lista: ');
      readln(num);
      end;
  end;

procedure impar (var contador:integer; num:integer);
  var
    dig:integer;
  begin
    while (num <> 0) do begin
      dig:= num MOD 10;
      num:= num DIV 10;
      end;
    if (dig MOD 2 <> 0) then
      contador:= contador + 1;
  end;

procedure generar (var l:lista; var contador, suma, total:integer; num:integer);
  var
    aux:lista;
    pares:lista;
  begin
    new (pares);
    aux:= l;
    while (aux <> nil) do begin
      total:= total + 1;
      if (num MOD 2 = 0) then
        agregar (pares,num);
      impar (contador,num);
      if (num > 9) and (num < 51) then
        suma:= suma + 1;
      end;
  end;

var
  l:lista;
  num,contador,total,suma:integer;
begin
  contador:= 0;
  total:= 0;
  suma:= 0;
  new (l);
  write('Ingrese un numero para la lista: ');
  readln(num);
  cargarl (l,num);
  generar (l,contador,suma,total,num);
  writeln ('La canditad de numeros que comienzan con digito impar son: ',contador);
  writeln ('El porcentaje de numeros entre 10 y 50 es: ',suma / total);
  writeln ('Presione ENTER para finalizar');
  readln;
end.
