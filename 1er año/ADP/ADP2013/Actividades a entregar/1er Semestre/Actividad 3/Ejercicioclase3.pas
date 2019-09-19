Program ejercicioclase3;
const
  dimF = 1000;
type
  rango = 1 .. 50;
  cadena30 = string [30];
  invitado = record
           DNI:integer;
           nombre:cadena30;
           apellido:cadena30;
           edad:integer;
           mesa:rango;
           end;
  vectorinvitado = array [1 .. dimF] of invitado;
  vectormesa = array [rango] of integer;

procedure inicializarvector (var v2:vectormesa);
  var
    i:integer;
  begin
    for i:= 1 to 50 do
      v2[i]:= 0;
  end;

procedure leerinvitado (var inv:invitado);
  begin
    with inv do begin
      write('Ingrese el DNI del invitado: ');
      readln(DNI);
      if (DNI <> 0) then begin
        write('Ingrese el apellido del invitado: ');
        readln(apellido);
        write('Ingrese el nombre del invitaado: ');
        readln(nombre);
        write('Ingrese la edad del invitado: ');
        readln(edad);
        write('Ingrese la mesa asignada para el invitado: ');
        readln(mesa);
        end;
      end;
  end;

procedure cargarvectorinvitado (var v1:vectorinvitado; var dimL:integer);
  var
    inv:invitado;
  begin
    leerinvitado (inv);
    while (inv.DNI <> 0) and (dimL < dimF) do begin
      dimL:= dimL + 1;
      v1[dimL]:= inv;
      leerinvitado (inv);
      end;
  end;

procedure cumpleDNI (var v1:vectorinvitado; var cantdnipar:integer; i:integer);
  var
    par,impar,num,digito:integer;
  begin
    par:= 0;
    impar:= 0;
    num:= v1[i].DNI;
    while (num <> 0) do begin
      digito:= num MOD 10;
      if ((digito MOD 2) = 0) then begin
        par:= par + 1;
        end
      else
        impar:= impar + 1;
      num:= num DIV 10;
      end;
    if (par > impar) then
      cantdnipar:= cantdnipar + 1;
  end;

procedure mesaconmenosgente (var v2:vectormesa; var nummesa:integer);
  var
    minmesa,j:integer;
  begin
    minmesa:= 100;
    for j:= 1 to 50 do
      if (v2[j] < minmesa) then begin
        minmesa:= v2[j];
        nummesa:= j;
        end;
  end;

var
  v1:vectorinvitado;
  v2:vectormesa;
  dimL,sumaedad,cantmenos8,cantdnipar,nummesa,i,mesaasignada:integer;
begin
  dimL:= 0;
  sumaedad:= 0;
  cantmenos8:= 0;
  cantdnipar:= 0;
  inicializarvector (v2);
  cargarvectorinvitado (v1,dimL);
  for i:= 1 to dimL do begin
    sumaedad:= sumaedad + v1[i].edad;
    if (v1[i].edad < 8) then
      cantmenos8:= cantmenos8 + 1;
    cumpleDNI (v1,cantdnipar,i);
    mesaasignada:= v1[i].mesa;
    v2[mesaasignada]:= v2[mesaasignada] + 1;
    end;
  mesaconmenosgente (v2,nummesa);
  writeln('El promedio de edad de los invitados es: ',sumaedad / dimL);
  writeln('La cantidad de invitados menores de 8 anos es: ',cantmenos8);
  writeln('La cantidad de invitados con mas digitos pares que impares en su DNI es: ',cantdnipar);
  writeln('La mesa con menos cantidad de gente es la: ',nummesa);
  writeln('Presione ENTER para finalizar');
  readln;
end.
