TAD Tarbol;
Interface
  type exportado arbol;

  procedure crear(var a:arbol);
  procedure agregar(var a:arbol; num:integer);
  function altura(a:arbol):integer;
  function nodos (a:arbol):integer;
  function maximo(a:arbol):integer;
  function minimo(a:arbol):integer;
  procedure asignar(var a1:arbol; a2:arbol);
  function vacia(a:arbol):boolean;

Implementacion
  type
    arbol = ^nodo;
    nodo = record
      dato:integer;
      hi:arbol;
      hd:arbol;
    end;

  procedure crear(var a:arbol);
    begin
      a:=nil;
    end;

  function vacia(a:arbol):boolean;
    begin
      if (a=nil)then vacia:=true
      else vacia:=false;
    end;

  procedure agregar(var a:arbol; num:integer);
    begin
      if (a<>nil)then
        if (num<a^.dato)then agregar(a^.hi,num)
        else agregar(a^.hd,num)
      else
        a^.dato:=num;
    end;

  procedure contar(a:arbol; var num:integer);
    begin
      if (a<>nil)then begin
        num:=num+1;
        contar(a^.hi,num);
        contar(a^.hd,num);
      end;
    end;

  function nodos(a:arbol):integer;
    var
      num:integer
    begin
      num:=0;
      contar(a,num);
      nodos:=num;
    end;

  function maximo(a:arbol):integer;
    begin
      while (a^.hd<>nil)do
        a:=a^.hd;
      maximo:=a^.dato;
    end;
  function minimo(a:arbol):integer;
    begin
      while (a^.hi<>nil)do
        a:=a^.hi;
      minimo:=a^.dato;
    end;
  procedure asignar(var a1:arbol; a2:arbol);
    begin
      a1:=a2;
    end;

  function altura(a:arbol):integer;         //HACER
    begin
    end;
