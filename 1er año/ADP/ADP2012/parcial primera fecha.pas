{ Realice un programa que lea la informacion de las ventas de instrumentos musicales. De cada venta se lee: numero de venta, informacion del cliente (DNI, apellido, nombre), tipo de instrumento comprado (1..20),
  marca, modelo, año de fabricacion y monto abonado. La lectura finaliza cuando llega el DNI 0 (el cual no debe procesarse). Tener en cuenta que puede haber varias ventas para un mismo cliente
  (cada venta corresponde a un unico instrumento) y que la informacion viene ordenada por DNI del cliente.

  se pide:
  1- Informar el monto total abonado para cada cliente.
  2-Informar el tipo de instrumento que tuvo mas ventas.
  3-Informar la cantidad de instrumentos vendidos de marca YAMAHA.     }



program Parcial;

         {----------------Tipos de dato---------------}

type
  rango = 1..20;

  cliente = record
    DNI:integer;
    apellido:string[15];
    nombre:string[15];
  end;

  venta = record
    numero:integer;
    info:cliente;
    tipo:rango;
    marca:string[12];
    modelo:string[10];
    fabricacion:integer;
    monto:integer;
  end;

  instrumento = array [rango] of integer;

  palabra = string[12];


    {----------------Comienzan los procedos------------------}

procedure LeerCliente (var c:cliente);
  begin
    with c do begin
      writeln('DNI del cliente: ');
      readln(DNI);
      if (DNI <> 0) then begin
        writeln('Apellido del cliente: ');
        readln(apellido);
        writeln('Nombre del cliente: ');
        readln(nombre);
      end;
    end;
  end;

procedure LeerVenta (var v:venta; var c:cliente);
  begin
    with v do begin
      writeln('Numero de cliente: ');
      readln(numero);
      LeerCliente(c);
      if (c.DNI <> 0) then begin
        writeln('Tipo de instrumento (1 al 20) ');
        readln(tipo);
        writeln('Marca del instrumento: ');
        readln(marca);
        writeln('Modelo del instrumento: ');
        readln(modelo);
        writeln('Ano de fabricacion del instrumento: ');
        readln(fabricacion);
        writeln('Monto abonado: ');
        readln(monto);
      end;
    end;
  end;

procedure Inicializar (var ins:instrumento);
  var
    i:integer;
  begin
    for i:= 1 to 20 do
      ins[i]:= 0;
  end;

procedure Actualizar (var tipo:rango; var ins:instrumento; var max:integer; var tipoinstru:rango);
  begin
    ins[tipo]:= ins[tipo] + 1;
    if (ins[tipo] > max) then begin
      max:= ins[tipo];
      tipoinstru:= tipo;
    end;
  end;

procedure MarcaYamaha (marca:palabra; var cant:integer);
  begin
    if (marca = 'YAMAHA') or (marca = 'yamaha') then
      cant:= cant + 1;
  end;


  {---------------------Programa Principal--------------------}

var
  v:venta;
  c:cliente;
  ins:instrumento;
  total:integer;
  cant:integer;
  save:integer;
  max:integer;
  tipoinstru:rango;
begin
  cant:= 0;
  max:= -1;
  Inicializar(ins);
  LeerVenta(v, c);
  while (c.DNI <> 0) do begin
    save:= c.DNI;
    total:= 0;
    while (save = c.DNI) and (c.DNI <> 0) do begin
      total:= total + v.monto;
      MarcaYamaha(v.marca, cant);
      Actualizar(v.tipo, ins, max, tipoinstru);
      LeerVenta(v, c);
    end;
    writeln('El monto total que debe pagar el cliente es de: ',total);
  end;
  writeln('La cantidad de instrumentos vendidos de marca yamaha es: ',cant);
  writeln('El tipo de instrumento que tuvo mas ventas es ',tipoinstru,' con ',max,' ventas.');
  writeln('Presione ENTER para finalizar... ');
  readln();
  readln();
end.



