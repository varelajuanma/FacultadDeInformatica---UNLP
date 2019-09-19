{ Un teatro abre su boleteria para la venta de entradas (a lo sumo 250). Realice un programa que:
A) Simule la recepcion de las personas en la boleteria. De cada persona se lee: nombre, DNI, y el codigo (1..15)
   de los espectaculos en los que esta interesado asistir (a lo sumo 5). La lectura de personas finaliza al leer
   DNI 0, y la lectura de codigos de espectaculo de cada persona finaliza al leer el codigo 0.

Luego de realizar el punto a) calcular e informar:

B) El codigo de espectaculo que recibira mayor cantidad de personas.
C) La cantidad de personas que concurriran al menos a 3 espectaculos.
D) La cantidad de personas que tienen en su DNI al menos 2 digitos repetidos.
   Ejemplo: el DNI 22333910 tiene repedito el digito 2 y 3, por lo tanto tiene al menos 2 digitos repetidos y debe contarse.

NOTA: Definir todas las estructuras de datos utilizadas. Modularizar. }

Program Parcial2012;
Type
  cadena30 = string [30];
  rango = 1 .. 15;
  persona = record
          nombre:cadena30;
          DNI:integer;
          codigo:rango;
          end;
  vectorcodigo = array [rango] of integer;
  number = 1 .. 9;
  conjnum = set of number;

procedure inicializarvectorcodigo (var v:vectorcodigo);
  var
    i:integer;
  begin
    for i:= 1 to 15 do
      v[i]:= 0;
  end;

procedure leerpersona (var per:persona);
  begin
    with per do begin
      write('Ingrese el nombre de la persona: ');
      readln(nombre);
      write('Ingrese el DNI de la persona: ');
      readln(DNI);
      if (DNI <> 0) then begin
        write('Ingrese el codigo de espectaculo: ');
        readln(codigo);
        end;
      end;
  end;

procedure incisoB (var per:persona; var v:vectorcodigo; var maxcod:integer);
  var
    cod:integer;
  begin
    cod:= per.codigo;
    v[cod]:= v[cod] + 1;
    if (v[cod] > maxcod) then
      maxcod:= cod;
  end;

procedure incisoC (var per:persona; var cantper:integer);
  var
    cantcod:integer;
  begin
    cantcod:= 0;
    while (per.codigo <> 0) and (cantcod < 5) do begin
      cantcod:= cantcod + 1;
      write('Ingrese el codigo del siguiente espectaculo: ');
      readln(per.codigo);
      end;
    if (cantcod >= 3) then
      cantper:= cantper + 1;
  end;

procedure incisoD (var per:persona; var cantdigrep:integer);
  var
    leidos:conjnum;
    repetidos:conjnum;
    digito:integer;
    num,cantrep:integer;
  begin
    cantrep:= 0;
    leidos:= [];
    repetidos:= [];
    num:= per.DNI;
    while (num <> 0) do begin
      digito:= num MOD 10;
      if (digito IN leidos) then begin
        repetidos:= repetidos + [digito];
        cantrep:= cantrep + 1;
        end
      else
        leidos:= leidos + [digito];
      num:= num DIV 10;
      end;
    if (cantrep >= 2) then
      cantdigrep:= cantdigrep + 1;
  end;

procedure informar (var maxcod,cantper,cantdigrep:integer);
  begin
    writeln('El espectaculo que recibio mayor cantidad de personas es el codigo: ',maxcod);
    writeln('La cantidad de personas que concurrieron a al menos a 3 espectaculos es: ',cantper);
    writeln('La cantidad de personas que en su DNI tiene al menos 2 digitos repetidos es: ',cantdigrep);
  end;

var
  v:vectorcodigo;
  per:persona;
  maxcod,cantper,cantdigrep,entradas:integer;
begin
  maxcod:= 0;
  cantper:= 0;
  cantdigrep:= 0;
  entradas:= 0;
  inicializarvectorcodigo (v);
  writeln('BOLETERIA');
  leerpersona (per);
  while (per.DNI <> 0) and (entradas < 250) do begin
    entradas:= entradas + 1;
    incisoB (per,v,maxcod);
    incisoC (per,cantper);
    incisoD (per,cantdigrep);
    leerpersona (per);
    end;
  informar (maxcod,cantper,cantdigrep);
  writeln('Presione ENTER para finalizar');
  readln;
end.
