program Ejercicio1;

type
  arbol = ^nodo;
  nodo = record
    hi:arbol;
    hd:arbol;
    dato:integer;
  end;

procedure insertar ( var a:arbol; num: integer);
begin
  if (a=nil) then
    begin
      new(a);
      a^.dato:=num;
      a^.hi:=nil;
      a^.hd:=nil;
    end
  else
    if (num < a^.dato) then insertar(a^.hi,num)
    else insertar (a^.hd,num);
end;

procedure generarArbol ( var a:arbol);
var
  num,aux:integer;
begin
  aux:=0;
  while (aux <= 100) do
    begin
      readln(num);
      insertar(a,num);
      aux:= aux+1;
    end;
end;

procedure decreciente(a:arbol);
begin
  if (a<>nil) then
    begin
      decreciente(a^.hd);
      writeln(a^.dato);
      decreciente(a^.hi);
    end;
end;

procedure busqueda(a:arbol; num:integer; var veces:integer);
begin
  if (a<>nil) then
    begin
      if (a^.dato = num)then
        begin
          veces:=veces+1;
          busqueda(a^.hd,num,veces);
        end
      else
        if (a^.dato < num)then busqueda(a^.hd,num,veces)
        else busqueda(a^.hi,num,veces);
    end;
end;

procedure buscar(a:arbol);
var
  num,veces:integer;
begin
  veces:=0;
  write('Introducir numero a buscar: ');
  readln(num);
  busqueda(a,num,veces);
  writeln('Veces encontrado: ' ,veces );
end;


//Programa Principal

var
  a:arbol;
begin
  a:=nil;
  generarArbol(a);
  writeln('Orden decreciente: ');
  decreciente(a);
  buscar(a);
  readln();
  readln();
end.
