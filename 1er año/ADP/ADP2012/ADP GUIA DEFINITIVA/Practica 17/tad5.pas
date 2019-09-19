TAD Tteatro;
Interfase
  type exportado teatro;
  procedure crear(var t:teatro);
  function butacaLibre( t:teatro; f:integer):boolean;
  function primerLibre( t:teatro; f:integer):integer;
  procedure vender( var t:teatro; f:integer; b:integer);
  procedure liberar(var t:teatro; f:integer; b:integer);

Implementacion
  type
    teatro = array [1..30,1..40]of boolean;

  procedure crear( var t:teatro);
    begin
      for f:=1 to 30 do
        for c:=1 to 40 do
          t[f,c]:=false;
    end;

  function butacaLibre( t:teatro; f:integer):boolean;
    var
      i:integer;
    begin
      i:=1;
      while (i<=40) and (t[f,i]<>false)do
        i:=i+1;
      if (i>40) then butacaLibre:=true
      else butacaLibre:=false;
    end;

  function primerLibre( t:teatro; f:integer):integer;
    var
      i:integer
    begin
      i:=1;
      while (t[f,i]<>false) do
        i:=i+1;
      primerLibre:=i;
    end;

  procedure vender( var t:teatro; f:integer; b:integer);
    begin
      t[f,b]:=true;
    end;

  procedure liberar(var t:teatro; f:integer; b:integer);
    begin
      t[f,b]:=false;
    end;
//Programa

program Teatro;
uses Tteatro;
type
  operacion=record
    comprar:boolean;
    fila:integer;
    butaca:integer;
  end;

  lista=^nodo;
  nodo=record
    dato:operacion;
    sig:lista;
  end;

procedure crearVacio(var t:teatro);
  begin
    crear(t);
  end;

procedure operacion(var t:teatro; l:lista);
  begin
    while (l<>nil) do
      begin
        if (l^.dato.comprar = true) then
          if (butacaLibre(t,l^.dato.fila)=true)then vender(t,l^.dato.fila,l^.dato.butaca)
          else writeln('No hay butaca disponible en esa fila');
        else
          liberar(t,l^.dato.fila,l^.dato.butaca);
      end;
  end;

//Programa Principal

var
  l:lista;
  t:teatro;
begin
  cargar(l);//se dispone
  crearVacio(t);
  operacion(t,l);
end.
