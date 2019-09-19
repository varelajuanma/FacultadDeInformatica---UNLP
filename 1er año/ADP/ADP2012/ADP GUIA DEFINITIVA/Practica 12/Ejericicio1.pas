program Ejercicio1;
type
  vector=array[1..9] of integer;
  strg20=string[20];

  nodo=^reg;

  reg=record
    dni:integer;
    nombre:strg20;
    apellido:strg20;
    id:1..9;
    monto:real;
    sig:nodo;
  end;


procedure atencion(var pri:nodo; var ult:nodo);
var
  aux:nodo;
  total:real;
  noAtendidos,dni:integer;
begin
  total:=0;
  noAtendidos:=0;
  write('DNI: ');
  readln(dni);
  while (dni<>0)do begin
    new(aux);
    aux^.dni:=dni;
    write('Nombre: ');
    readln(aux^.nombre);
    write('Apellido: ');
    readln(aux^.apellido);
    write('Id del impuesto(1/9): ');
    readln(aux^.id);
    write('Monto: ');
    readln(aux^.monto);
    if (total<100000)then begin
      total:= total + aux^.monto;
      if (pri=nil) then pri:=aux
      else ult^.sig:=aux;
      ult:=aux;
      ult^.sig:=nil;
    end
    else noAtendidos:= noAtendidos + 1;
    writeln('--------------------------------------------');
    write('DNI: ');
    readln(dni);
  end;
  writeln('No se atendieron a ',noAtendidos,' clientes.');
  readln();
end;

procedure cargarVector(var v:vector);
var
  i:integer;
begin
  for i:=1 to 9 do
    v[i]:=0;
end;

procedure informar(pri:nodo; v:vector);
var
  max,maxid,i:integer;
begin
  max:=0;
  while (pri<>nil) do begin
    v[pri^.id]:= v[pri^.id] + pri^.id;
    pri:=pri^.sig;
  end;

  for i:=1 to 9 do
    if (v[i]>max)then begin
      max:=v[i];
      maxid:=i;
    end;
  writeln('El impuesto que mas se pago fue el ',maxid);
  readln();
end;

{Programa Principal}

var
  pri,ult:nodo;
  v:vector;
begin
  atencion(pri,ult);
  cargarVector(v);
  informar(pri,v);
  readln();
  readln();
end.



