program Ejercicio2;
type
  producto = record
    id:integer;
    descripcion:string[50];
    ventas:integer;
  end;

  lista = ^nodo;

  nodo = record
    dato:producto;
    sig:lista;
  end;



procedure buscarMinimo(var l1:lista; var l2:lista; var reg:producto);

begin
  if (l1=nil)and(l2=nil) then reg.id:=999
  else
    if (l1<>nil)and(l2<>nil)then
      if (l1^.dato.id<=l2^.dato.id)then
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
      if (l1<>nil)then
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

procedure agregarRegistro(var l3:lista; aux:producto);
var
  ant,act,nuevo:lista;
begin
  new(nuevo);
  nuevo^.dato.id:=aux.id;
  nuevo^.dato.ventas:=aux.ventas;
  nuevo^.sig:=nil;
  ant:=l3;
  act:=l3;
  while (act <> nil) do
    begin
      ant:=act;
      act:=act^.sig;
    end;
  if (ant=nil) then l3:=nuevo
  else ant^.sig:=nuevo;
end;

procedure max1y2(aux: producto; var max1:integer;var max2:integer; var maxid1:integer; var maxid2:integer);
begin
  if (aux.ventas>max1)then
    begin
      max2:=max1;
      maxid2:=maxid1;
      max1:=aux.ventas;
      maxid1:=aux.id;
    end
  else
    if (aux.ventas>max2)then
      begin
        max2:=aux.ventas;
        maxid2:=aux.id;
      end;
end;

{Programa Principal}
var
  l1,l2,l3:lista;
  aux,reg:producto;
  max1,max2,maxid1,maxid2:integer;
begin
  max1:=-1;
  maxid1:=-1;
  l3:=nil;
  buscarMinimo(l1,l2,reg);
  while (aux.id<>999) do
    begin
      aux.ventas:=0;
      aux.id:=reg.id;
      while (aux.id=reg.id) do
        begin
          aux.ventas:=aux.ventas+1;
          buscarMinimo(l1,l2,reg);
        end;
      agregarRegistro(l3,aux);
      max1y2(aux,max1,max2,maxid1,maxid2);
      actualizarStock(l4,aux);  <--------- VER
      buscarMinimo(l1,l2,reg);
    end;
  writeln('Productos mas vendidos: ',maxid1,' y ',maxid2);
end.


