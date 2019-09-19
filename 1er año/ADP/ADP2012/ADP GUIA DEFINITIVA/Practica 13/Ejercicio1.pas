program Ejercicio1;

type
  
  sucursal = record
    id:integer;
    ventas:integer;
  end;

  lista = ^nodo;

  nodo = record
    dato:sucursal;
    sig:lista;
  end;  



procedure buscarMinimo(var l1:lista; var l2:lista; var reg:sucursal);
begin
  if (l1=nil)and(l2=nil) then reg.id:=999
  else
    if (l1<>nil)and(l2<>nil)then
      if(l1^.dato.id <= l2^.dato.id) then
        begin
  	      reg:=l1^.dato;
	      l1:=l1^.sig;
        end
      else
        begin
          reg:=l2^.dato;
          l2:=l2^.sig;
        end
    else
      if (l1<>nil) then
        begin
          reg:=l1^.dato;
          l1:=l1^.sig;
        end
      else
        begin
          reg:=l2^.dato;
          l2:=l2^.sig;
        end;
end;
  
procedure agregarRegistro(var l3:lista; aux:sucursal);
var
  ant,act,nuevo:lista;
begin
  new(nuevo);
  nuevo^.dato.id:=aux.id;
  nuevo^.dato.ventas:=aux.ventas;
  nuevo^.sig:=nil;
  {ant:=l3;}
  act:=l3;
  while (act<>nil)do
    begin
      ant:=act;
      act:=act^.sig;
    end;
  if (l3=nil) then l3:=nuevo
    else ant^.sig:=nuevo;
end;

{Programa Principal}

var
  reg,aux: sucursal;
  l1,l2,l3: lista;

begin
  l3:=nil;
  buscarMinimo(l1,l2,reg);
  while(reg.id<>999)do begin
    aux.ventas:=0;
    aux.id:=reg.id;
    while(reg.id=aux.id)do begin
      aux.ventas:=aux.ventas + reg.ventas;
      buscarMinimo(l1,l2,reg);
    end;
    agregarRegistro(l3,aux);
    buscarMinimo(l1,l2,reg);
  end; 
end.


