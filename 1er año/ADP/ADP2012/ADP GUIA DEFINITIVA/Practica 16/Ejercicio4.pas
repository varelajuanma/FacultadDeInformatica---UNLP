program Ejercicio4;

type
  listaSuc = ^nodoSuc;
  nodoSuc = record
    destino:string[20];
    km:integer;
    ventas:integer;
    sig:listaSuc;
  end;

  lista=^nodoL;
  nodoL=record
    destino:string[20];
    ventas:integer;
    sig:lista;
  end;

  arbol = ^nodo;
  nodo = record
    dato:integer;
    lista:lista;
    hi:arbol;
    hd:arbol;
  end;

procedure agregarArbol(var aL:lista; lsuc:listaSuc);
var
  ok:boolean;
begin
  ok:=true;
  while (aL<>nil)and ok do
    begin
      if (aL^.destino = lsuc^.destino)then
        begin
          aL^.ventas:= aL^.ventas + lsuc^.ventas;
          ok:=false;
        end
      else aL:=aL^.sig;
    end;
end;

procedure insertarArbol(var a:arbol; lsuc:listaSuc);
begin
  if (a=nil) then
    begin
      new(a);
      a^.dato:=lsuc^.km;
      a^.lista^.destino:=lsuc^.destino;
      a^.lista^.ventas:=lsuc^.ventas;
      a^.lista^.sig:=nil;
      a^.hi:=nil;
      a^.hd:=nil;
    end
  else
    if (lsuc^.km = a^.dato) then agregarArbol(a^.lista, lsuc)
    else
      if (lsuc^.km < a^.dato) then insertarArbol(a^.hi, lsuc)
      else insertarArbol(a^.hd, lsuc);
end;

procedure generarArbol(var a:arbol; lsuc:listaSuc);
begin
  a:=nil;
  while (lsuc<>nil) do
    begin
      insertarArbol(a,lsuc);
      lsuc:=lsuc^.sig;
    end;
end;

//Programa Principal

var
  a:arbol;
  lsuc:listaSuc;
begin
  generarArbol(a,lsuc);
end.
