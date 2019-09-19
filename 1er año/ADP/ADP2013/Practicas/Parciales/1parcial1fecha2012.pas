{Realice un programa que lea informacion de las ventas de repuestos de automoviles. De cada venta se lee:
numero de venta, informacion del clientes (DNI,apellido,nombre), tipo de respuesto (1..20), marca, modelo,
año de fabricacion y monto abonado. La lectura termina cuando llega el DNI 0 (el cual no debe procesarse).
Tener en cuenta q puede haber varias ventas para un mismo cliente (cada venta corresponde a un unico repuesto)
y que la informacion viene ordenanda por DNI del cliente.
Se pide:
        a)Informar el monto total abonado para cada cliente.
        b)Informar el tipo de repuesto que tuvo menos ventas.
        c)Informar la cantidad de repuestos vendidos de marca "FORD".
        d)Informar para cada cliente si su DNI posee todos los digitos impares. Ejemplo:el DNI 12357689 posee
          todos los digitos impares.
NOTA: modularizar la solucion.}

Program primerparcial2012;
type
  rango = 1 .. 20;
  numeros = 1 .. 9;
  cliente = record
          dni:integer;
          apellido:string [30];
          nombre:string [30];
          end;
  ventas = record
          nroventa:integer;
          infocliente:cliente;
          tiporepuesto:rango;
          marca:string [30];
          modelo:string [30];
          anofabri:integer;
          monto:real;
          end;
  vector = array [rango] of integer;
  conjnum = set of numeros;

procedure iniciarvector (var v:vector);
  var
    i:integer;
  begin
    for i:= 1 to 20 do
      v[i]:= 0;
  end;

procedure leerventa (var ven:ventas);
  begin
    with ven do begin
      write('Ingrese el numero de venta: ');
      readln(nroventa);
      write('Ingrese el DNI del cliente: ');
      readln(infocliente.dni);
      if (infocliente.dni <> 0) then begin
        write('Ingrese el apellido del cliente: ');
        readln(infocliente.apellido);
        write('Ingrese el nombre del cliente: ');
        readln(infocliente.nombre);
        write('Ingrese el tipo de respuesto: '); {1 a 20}
        readln(tiporepuesto);
        write('Ingrese la marca del auto: ');
        readln(marca);
        write('Ingrese el modelo del auto: ');
        readln(modelo);
        write('Ingrese el ano de fabricacion del auto: ');
        readln(anofabri);
        write('Ingrese el monto de la reparacion: ');
        readln(monto);
        end;
      end;
  end;

procedure montototal (var ven:ventas; var dniaux:integer);
  var
    total:real;
  begin
    if (dniaux = ven.infocliente.dni) then begin
      total:= total + ven.monto;
      end
    else
      writeln('El monto total del cliente con dni ',dniaux,' es: ',total);
      total:= 0;
      dniaux:= ven.infocliente.dni;
  end;

procedure menosventa (var ven:ventas; var v:vector);
  var
    pos:integer;
  begin
    pos:= ven.tiporepuesto;
    v[pos]:= v[pos] + 1;
  end;

procedure marcaford (var ven:ventas; var cantford:integer);
  begin
    if (ven.marca = 'ford') then
      cantford:= cantford + 1;
  end;

procedure digitosimpares (var ven:ventas);
  var
    impar:conjnum;
    digito,num,cant:integer;
  begin
    impar:= [1,3,5,7,9];
    num:= ven.infocliente.dni;
    cant:= 0;
    while (num <> 0) do begin
      digito:= num MOD 10;
      if (digito IN impar) then begin
        cant:= cant + 1;
        end;
      num:= num DIV 10;
      end;
    if (cant = 5) then
      writeln ('El dni ',ven.infocliente.dni,' del cliente posee todos los digitos impares');
  end;

procedure informarmenorventa (var v:vector);
  var
    min,i,repmenor:integer;
  begin
    min:= 999;
    for i:= 1 to 20 do
      if (v[i] < min) then begin
        repmenor:= i;
        min:= v[i];
        end;
    writeln('El repuesto ',repmenor,' tuvo menos ventas');
  end;

var
  ven:ventas;
  v:vector;
  dniaux,cantford:integer;
begin
  cantford:= 0;
  iniciarvector (v);
  writeln('INGRESE VENTA');
  leerventa (ven);
  dniaux:= ven.infocliente.dni;
  while (ven.infocliente.dni <> 0) do begin
    montototal(ven,dniaux);
    menosventa(ven,v);
    marcaford(ven,cantford);
    digitosimpares(ven);
    writeln('INGRESE VENTA');
    leerventa(ven);
    end;
  informarmenorventa(v);
  writeln('La cantidad de repuestos ford vendidos es ',cantford);
  writeln('Presione ENTER para finalizar');
  readln;
end.
