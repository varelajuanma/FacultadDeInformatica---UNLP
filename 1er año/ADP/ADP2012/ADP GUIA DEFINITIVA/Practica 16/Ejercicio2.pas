program Ejercicio2;

type
  arbol= ^nodo;
  nodo = record
    hi:arbol;
    hd:arbol;
    dato:integer;
  end;

procedure insertar ( var an:arbol; num: integer);
begin
  if (an=nil) then
    begin
      new(an);
      an^.dato:=num;
      an^.hi:=nil;
      an^.hd:=nil;
    end
  else
    if (num > an^.dato) then insertar(an^.hi,num)
    else insertar (an^.hd,num);
end;

procedure buscarImparYagregar(var an:arbol; av:arbol);
begin
  if (av<>nil) then
    begin
      buscarImparYagregar(an,av^.hi);
      buscarImparYagregar(an,av^.hd);
      if (av^.dato mod 2 = 1)then
        insertar(an,av^.dato);
    end;
end;

procedure generarArbol(var an:arbol; av:arbol);
begin
  an:=nil;
  buscarImparYagregar(an,av);
end;
{
procedure generarArbolViejo ( var av:arbol);
var
  num,aux:integer;
begin
  aux:=0;
  while (aux <= 100) do
    begin
      readln(num);
      insertar(av,num);
      aux:= aux+1;
    end;
end;

procedure ImprimirArbolNuevo(an:arbol);
begin
  if (an<>nil) then
    begin
      ImprimirArbolNuevo(an^.hd);
      writeln(an^.dato);
      ImprimirArbolNuevo(an^.hi);
    end;
end;
}    // <-- para probar si anda

//Programa Principal

var
  an,av:arbol;
  num:integer;
begin
  generarArbolViejo(av); // <-- para probar si anda
  generarArbol(an,av);
  ImprimirArbolNuevo(an); // <-- para probar si anda
  readln();
  readln();
end.





