program ejer7;
Const
  tam=50;
  tam2=1000;
type
  anos=1..100;
  subrango=1..tam2;
  conjunto=set of 0..9;
  vector=array [1..tam] of subrango;
  facturacion=array [subrango] of real;
  cant=array [subrango] of integer;
  persona=record
          nombre:string[20];
          edad:anos;
          codigo:vector;
        end;

procedure iniciarvector(var vec:cant);
var
  i:integer;
begin
  for i:=1 to tam2 do
   vec[i]:=0;
end;

procedure cargarvector (var vec:vector;var dimlog:integer);
 var
   cod:integer;
 begin
   dimlog:=0;
   read (cod);
   while (cod<>-1) and (dimlog>=tam)do
    begin
     dimlog:=dimlog+1;
     vec[dimlog]:=cod;
   end;
 end;

procedure cargarregistro (var r:persona; var vec:vector; var dimlog:integer);
 begin
  with r do
   begin
    read(nombre);
    if (nombre <> 'zzz') then
     begin
      read(edad);
      cargarvector(vec,dimlog);
     end;
   end;
 end;

procedure productos (precios:facturacion; vec:vector; var cantidad:cant;var monto:real; dimlog:integer);
var
  i:integer;
begin
  monto:=0;
  for i:=1 to dimlog do
   begin
    cantidad[vec[i]]:=cantidad[vec[i]]+1;
    monto:=monto + (precios[vec[i]]);
   end;
end;

procedure edades (num:anos; var digitos:conjunto);
var
 digito: integer;
begin
 while (num<>0)do
  begin
   digito:=num mod 10;
   num:=num div 10;
   if (digito In digitos) then
     digitos:=digitos - [digito];
  end;
end;

function evaluarmax(vec:cant):integer;
var
  cantmax:integer;
  prodmax:integer;
  i:integer;
begin
  cantmax:=-1;
  for i:=1 to tam2 do
   begin
    if(vec[i]>cantmax)then
      cantmax:=vec[i];
      prodmax:=i;
   end;
  evaluarmax:=prodmax;
end;

Var
   cliente:persona;
   vec:vector;
   dimlog:integer;
   digitos:conjunto;
   precios:facturacion;
   cantidad:cant;
   monto:real;
Begin
  digitos:=[0..9];
  cargarregistro(cliente,vec,dimlog);
  iniciarvector(cantidad);
  while (cliente.nombre<>'zzz') do
   begin
    edades(cliente.edad,digitos);
    productos (precios,cliente.codigo,cantidad,monto,dimlog);
    write ('El cliente ',cliente.nombre,' tiene un monto a pagar de ',monto);
    cargarregistro(cliente,vec,dimlog);
   end;
  write('El producto mas vendido es ', evaluarmax(cantidad))
end.






