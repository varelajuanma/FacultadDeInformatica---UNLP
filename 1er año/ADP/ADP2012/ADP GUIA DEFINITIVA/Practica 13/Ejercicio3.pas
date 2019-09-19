program Ejercicio3;
type
  f = record
    dia:1..31;
    mes:1..12;
    ano:1980..2011;
  end;

  recarga = record
    cod:integer;
    monto:integer;
    fecha:f;
  end;

  lista = ^nodo;
  nodo= record
    dato:recarga;
    sig:lista;
  end;

  vector = array [1..12]of lista;          // se dispone
  matriz = array [1..12,1..31]of real;    // se dispone

  celular = record
    cod:integer;
    montoAnual:real;
    montoAdicional:real;
  end;

  listaF = ^nodoF;
  nodoF = record
    dato:celular;
    sig:listaF;
  end;

//Procesos

procedure buscarMin(var aux:recarga; v:vector);
var
  min,idMin,i:integer;
begin
  min:=999;
  idMin:=0;
  for i:=1 to 12 do
    if (v[i]<>nil)then
      begin
        if (v[i]^.dato.cod<min)then
          begin
            min:= v[i]^.dato.cod;
            idMin:=i;
          end;
      end;
  if (idMin<>0) then
    aux:= v[idMin]^.dato
  else
    aux.cod:=999;
end;

function montoAdicional(aux1:recarga ; m:matriz): real;
begin
  montoAdicional:= m[aux1.fecha.mes,aux1.fecha.dia];
end;


procedure agragarAlfinal(montoAd:real; cod:integer; monto:real; var L:listaF; var ult:listaF );
var
  nuevo:listaF;
begin
  new(nuevo);
  nuevo^.dato.cod:= cod;
  nuevo^.dato.montoAnual:= monto;
  nuevo^.dato.montoAdicional:= montoAd;
  nuevo^.sig:=nil;

  if (L = nil) then L:=nuevo
  else ult^.sig:=nuevo;
  ult:=nuevo;
end;

procedure generarLista(v:vector; m:matriz; L:listaF);
var
  aux, aux1:recarga;
  monto,montoAd:real;
  ult:listaF;

begin
  buscarMin(aux,v);
    while (aux.cod <> 999) do
      begin
        aux1:=aux;
        monto:=0;
        montoAd:=0;
        while (aux1.cod = aux.cod) do
          begin
            monto:= monto + aux.monto;
            montoAd:= montoAd + montoAdicional(aux1,m);
            buscarMin(aux,v);
          end;
        agragarAlfinal(montoAd, aux1.cod, monto, L, ult);
      end;
end;


//Programa principal

var
  v:vector;
  m:matriz;
  L:listaF;
begin
  L:=nil;
  cargarVector(v);//se dispone
  cargarMatriz(m);//se dispone
  generarLista(v,m,L);
end.
