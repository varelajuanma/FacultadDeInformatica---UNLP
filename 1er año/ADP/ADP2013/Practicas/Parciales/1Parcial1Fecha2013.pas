Program parcial2013;
const
  dimF = 500;
type
  rango = 1 .. 30;
  pedido = record
         codigo:rango;
         cantidad:integer;
         cuit:integer;
         end;
  vectorpedidos = array [1 .. dimF] of pedido;
  vectorcodigos = array [rango] of integer;

procedure iniciarvectorcodigos (var vc:vectorcodigos);
  var
    i:integer;
  begin
    for i:= 1 to 30 do
      vc[i]:= 0;
  end;

procedure leerpedido (var ped:pedido);
  begin
    with ped do begin
      write('Ingrese el cuit del servicio tecnico: ');
      readln(cuit);
      if (cuit <> -1) then begin
        write('Ingrese el codigo de repuesto: ');
        readln(codigo);
        write('Ingrese la cantidad de respuestos: ');
        readln(cantidad);
        end;
      end;
  end;

procedure cargarvectorpedidos (var vp:vectorpedidos; var dimL:integer);
  var
    ped:pedido;
  begin
    dimL:= 0;
    leerpedido (ped);
    while (ped.cuit <> -1) and (dimL < 500) do begin
      dimL:= dimL + 1;
      vp[dimL]:= ped;
      leerpedido (ped);
      end;
  end;

procedure incisoB (var vc:vectorcodigos; var maxcod:integer);
  var
    i,max:integer;
  begin
    max:= -1;
    for i:= 1 to 30 do
      if (vc[i] > max) then begin
        max:= vc[i];
        maxcod:= i;
        end;
  end;

procedure incisoC (var vp:vectorpedidos; var cantped:integer; i:integer);
  var
    num,digito,suma:integer;
  begin
    suma:= 0;
    num:= vp[i].cuit;
    while (num <> 0) do begin
      digito:= num MOD 10;
      if ((digito MOD 2) <> 0) then
        suma:= suma + 1;
      num:= num DIV 10;
      end;
    if (suma <= 5) then
      cantped:= cantped + 1;
  end;

var
  vp:vectorpedidos;
  vc:vectorcodigos;
  dimL,maxcod,cantped,i,codrep:integer;
begin
  cantped:= 0;
  iniciarvectorcodigos (vc);
  cargarvectorpedidos (vp,dimL);
  for i:= 1 to dimL do begin
    codrep:= vp[i].codigo;
    vc[codrep]:= vp[i].cantidad;
    incisoC (vp,cantped,i);
    end;
  incisoB(vc,maxcod);
  writeln('El codigo de repuesto que tuvo mas pedidos fue el: ',maxcod);
  writeln('La cantidad de pedidos donde el cuit posee a lo sumo 5 digitos impares es: ',cantped);
  writeln('Presione ENTER para finalizar');
  readln;
end.
