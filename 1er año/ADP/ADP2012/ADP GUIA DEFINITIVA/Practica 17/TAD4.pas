TAD TColectivo;

Interfase
  type exportado Colectivo;
  procedure crear(var C:colectivo; d:string);
  procedure ocupar(var c:colectivo; n:integer);
  function cantLibres(c:colectivo):integer;
  procedure liberar(var c:colectivo; n:integer);
  function ocupado(c:colectivo; n:integer):boolean;
  function asientoLibre(c:colectivo):integer;
  function asientoValido(c:colectivo; n:integer):boolean;
  function hayLibre(c:colectivo):boolean;
  procedure asignar(var c1:colectivo; c2:colectivo);

Implementacion
  type
    vector = array [1..20] of boolean;
    colectivo = record
      destino:string;
      asientos:vector;
      cantLibres:integer;
    end;
  procedure crear(var c:colectivo; d:string);
    begin
      c.destino:=d;
      c.cantLibres:=20;
      for i:=1 to 20 do
        c.asientos[i]:=true;
    end;
  procedure ocupar(var c:colectivo; n:integer);
    begin
      c.asientos[n]:=false;
      c.cantLibres:=c.cantLibres-1;
    end;
  function cantLibres(c:colectivo):integer;
    begin
      cantLibres:=c.cantLibres;
    end;
  procedure Liberar(var c:colectivo; n:integer);
    begin
      c.asientos[n]:=true;
      c.cantLibres:=c.cantLibres+1;
    end;
  function ocupado(c:colectivo; n:integer):boolean;
    begin
      ocupado:= not c.asientos[n];
    end;
  function asientoLibre(c:colectivo):integer;
    var
      i:integer;
    begin
      i:=1;
      while not c.asientos[i]) do
        i:=i+1;
      asientoLibre:=i;
    end;
  function asientoValido(c:colectivo; n:integer):boolean;
    begin
      if (n<=20) and (n>=1) then
        asientoValido:=true;
      else asientoValido:=false;
    end;
  function hayLibre(c:colectivo):boolean;
    begin
      if (c.cantLibres>0) then hayLibre:=true
      else hayLibre:=false;
    end;
  procedure asignar(var c1:colectivo; c2:colectivo);
    begin
      c1:=c2;
    end;
// Programa
program Terminal;
uses Tcolectivo;
type
  lista=^nodo;
  nodo=record
    dato:colectivo;
    sig:lista;
  end;
  procedure agregar(var l:lista;c:colectivo);
    var
      aux:lista;
    begin
      new(aux);
      asignar(aux^.dato,c);
      aux^.sig:=l;
      l:=aux;
    end;
  function cantLlenos(l:lista):integer;
    var
      cant:integer;
    begin
      cant:=0;
      while (l<>nil) do begin
        if (not hayLibre(l^.dato))then
          cant:=cant+1;
        l:=l^.sig;
      end;
      cantLlenos:=cant;
    end;

//Programa Principal
var
  l:lista;
  d:string;
  c:colectivo;
begin
  l:=nil;
  cargar(l);//se dispone
  read(d);
  crear(c,d);
  agregar(l,c);
  write(cantLlenos(l));
end.
