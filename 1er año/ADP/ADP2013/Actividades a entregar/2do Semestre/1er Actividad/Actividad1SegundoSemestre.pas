Program actividad1;
type
  cadena = string [50];
  rango = 1 .. 5;
  pasajero = record
           DNI:integer;
           apellido:cadena;
           nombre:cadena;
           edad:integer;
           codtarifa:rango;
           end;
  listapas = ^nodo;
  nodo = record
           datos:pasajero;
           sig:listapas;
           end;

  vuelo = record
           codigo:integer;
           capacidadpas:integer;
           listapasajeros:listapas;
           end;
  listavuelos = ^nodo2;
  nodo2 = record
           datos:vuelo;
           sig:listavuelos;
           end;

  vectortar = array [rango] of real;

procedure incisoA (list:listavuelos; var cantvuelos:integer; totalpas:integer);
  begin
    if (list^.datos.capacidadpas = totalpas) then
      cantvuelos:= cantvuelos + 1;
  end;

procedure incisoB (list:listavuelos; var codmax,max:integer; cantaux:integer);
  begin
     if (cantaux > max) then begin
       max:=cantaux;
       codmax:=list^.datos.codigo;
       end;
  end;

function todospares (num:integer):boolean;
  var
    dig:integer;
    impares:boolean;
  begin
    impares:= true;
    while (num <> 0) and (impares = true) do begin
      dig:= num MOD 10;
      if ((dig MOD 2) = 0) then begin
        num:= num DIV 10;
        end
      else
        impares:= false;
      end;
    todospares:= impares;
  end;

procedure incisoC (list:listavuelos; var costototal:real; var vt:vectortar);
  var
    cod:integer;
  begin
    cod:= list^.datos.listapasajeros^.datos.codtarifa;
    costototal:= costototal + vt[cod];
  end;

var
  list:listavuelos;
  lp:listapas;
  cantvuelos,totalpas,codmax,num,cantaux,max:integer;
  costototal:real;
  vt:vectortar;
begin
  cantvuelos:= 0;
  max:= -1;
  while (list <> nil) do begin
    totalpas:= 0;
    costototal:= 0;
    cantaux:= 0;
    lp:= list^.datos.listapasajeros;
    while (lp <> nil) do begin
      totalpas:= totalpas + 1;
      if (lp^.datos.edad < 18) then begin
        num:= lp^.datos.DNI;
        if (todospares(num) = true) then
          cantaux:= cantaux + 1;
        end;
      incisoC (list,costototal,vt);
      lp:= lp^.sig;
      end;
    incisoB(list,codmax,max,cantaux);
    incisoA(list,totalpas,cantvuelos);
    writeln ('El costo total recaudado en este vuelo es de: ',costototal);
    list:= list^.sig;
    end;
  writeln ('La cantidad de vuelos cuya capacidad esta completa es de: ',cantvuelos);
  writeln ('El codigo de vuelo con mas pasajeros -18 años y todos digitos pares en el DNI es el: ',codmax);
  writeln ('Presione ENTER para finalizar');
  readln;
end.
