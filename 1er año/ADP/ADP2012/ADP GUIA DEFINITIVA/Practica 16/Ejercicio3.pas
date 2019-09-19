program Ejercicio3;

type
  arbol = ^nodo;
  nodo = record
    hi:arbol;
    hd:arbol;
    dato:integer;
  end;

  lista2 = ^nodol2;
  nodol2 = record
    dato:integer;
    sig:lista2;
  end;

  lista = ^nodoL;
  nodoL = record
    dato:integer;
    sig:lista;
    abajo:lista2;
  end;

{
procedure agregarEnlista(l:lista; nivel:integer; dato:integer);
var
  aux,ant:lista;
  aux2,ant2:lista2;
begin
  while (l^.dato <> nivel) and (l <> nil) do
    begin
      ant:=l;
      l:=l^.sig;
    end;
  if (l = nil) then
    begin
      new(aux);
      new(aux2);
      aux^.dato:=nivel;
      aux^.sig:=nil;
      aux2^.dato:=dato;
      aux2^.sig:=nil;
      aux^.abajo:=aux2;
      ant^.sig:=aux;
    end
  else
    begin
      new(aux2);
      aux2^.dato:=dato;
      aux2^.sig:=nil;
      while (l^.abajo<>nil) do
        begin
          ant2:=l^.abajo;
          l^.abajo:=l^.abajo^.sig;
        end;
      ant2^.sig:=aux2;
    end;
end;
}

procedure agregarEnlista(l:lista; nivel:integer; dato:integer);
var
  aux,ant:lista;
  aux2,ant2:lista2;
  ok:boolean;
begin
  ok:=true;
  while (ok=true) do
  begin
    if (l = nil) then
      begin
        new(aux);
        new(aux2);
        aux^.dato:=nivel;
        aux^.sig:=nil;
        aux2^.dato:=dato;
        aux2^.sig:=nil;
        aux^.abajo:=aux2;
        ant^.sig:=aux;
        ok:=false;
      end
    else
      begin
        if (l^.dato<>nivel)then
          begin
            ant:=l;
            l:=l^.sig;
          end
        else
          begin
            new(aux2);
            aux2^.dato:=dato;
            aux2^.sig:=nil;
            while (l^.abajo<>nil) do
              begin
                ant2:=l^.abajo;
                l^.abajo:=l^.abajo^.sig;
             end;
            ant2^.sig:=aux2;
            ok:=false;
          end;
      end;
  end;
end;

procedure insertar(a:arbol; nivel:integer; var l:lista); //inicializar nivel:=0
begin
  if (a<>nil) then
    begin
      agregarEnlista(l,nivel,a^.dato);
      nivel:=nivel + 1;
      insertar(a^.hd,nivel,l);
      insertar(a^.hi,nivel,l);
    end;
end;

procedure generarLista(a:arbol; var l:lista);
var
  nivel:integer;
begin
  nivel:=0;
  insertar(a,nivel,l)
end;


procedure imprimir(l:lista);
begin
  while (l<>nil) do
    begin
      writeln('Nivel: ',l^.dato);
      while (l^.abajo<>nil) do
        begin
          writeln('- dato: ',l^.abajo^.dato);
          l^.abajo:=l^.abajo^.sig;
        end;
      l:=l^.sig;
   end;
end;

procedure insertarArbol(var a:arbol; num:integer);
begin
  if (a=nil) then
    begin
      new(a);
      a^.dato:=num;
      a^.hd:=nil;
      a^.hi:=nil;
    end
  else
    if (num < a^.dato) then insertarArbol(a^.hi,num)
    else insertarArbol(a^.hd,num);
end;

procedure generarArbol(var a:arbol);
var
  num:integer;
begin
  readln(num);
  while (num<>0)do begin
    insertarArbol(a,num);
    readln(num);
  end;
end;

//Programa principal

var
  a:arbol;
  l:lista;
begin
  a:=nil;
  l:=nil;
  generarArbol(a);
  generarLista(a,l);
  imprimir(l);
  readln();
  readln();
end.

