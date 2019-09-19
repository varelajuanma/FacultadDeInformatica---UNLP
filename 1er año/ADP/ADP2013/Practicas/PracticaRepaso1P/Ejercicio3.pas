Program ejer3;
const
  dimF = 3000;
type
  cadena30 = string [30];
  rango = 1 .. 20;
  number = 1 .. 9;
  conjnum = set of number;
  entrada = record
          DNI:integer;
          nombre:cadena30;
          espectaculo:rango;
          end;
  vectorentradas = array [1 .. dimF] of entrada;
  vectorespectaculos = array [rango] of integer;

procedure iniciarvectorespectaculos (var v2:vectorespectaculos);
  var
    i:integer;
  begin
    for i:= 1 to 20 do
      v2[i]:= 0;
  end;

procedure leerentrada (var ent:entrada);
  begin
    with ent do begin
      write('Ingrese el DNI: ');
      readln(DNI);
      if (DNI <> 0) then begin
        write('Ingrese el nombre: ');
        readln(nombre);
        write('Ingrese el codigo del espectaculo: ');
        readln(espectaculo);
        end;
      end;
  end;

procedure cargarvectorentradas (var v1:vectorentradas; var dimL:integer);
  var
    ent:entrada;
  begin
    leerentrada (ent);
    while (ent.DNI <> 0) and (dimL < dimF) do begin
      dimL:= dimL + 1;
      v1[dimL]:= ent;
      leerentrada (ent);
      end;
  end;

procedure incisoB (var v2:vectorespectaculos; var maxespec:integer);
  var
    max,j:integer;
  begin
    max:= -1;
    for j:= 1 to 20 do
      if (v2[j] > max) then begin
        max:= v2[j];
        maxespec:= j;
        end;
  end;

procedure incisoC (var v1:vectorentradas; var cantper:integer; i:integer);
  var
    leidos,repetidos:conjnum;
    digito,num,cantrep:integer;
  begin
    leidos:= [];
    repetidos:= [];
    cantrep:= 0;
    num:= v1[i].DNI;
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
      cantper:= cantper + 1;
  end;

var
  v1:vectorentradas;
  v2:vectorespectaculos;
  i,dimL,maxespec,cantper,codig:integer;
begin
  maxespec:= 0;
  cantper:= 0;
  iniciarvectorespectaculos (v2);
  cargarvectorentradas (v1,dimL);
  for i:= 1 to dimL do begin
    incisoC (v1,cantper,i);
    codig:= v1[i].espectaculo;
    v2[codig]:= v2[codig] + 1;
    end;
  incisoB (v2,maxespec);
  writeln('El codigo de espectaculo que recibio mas personas es el: ',maxespec);
  writeln('La cantidad de personas que en su DNI tiene mas de 2 digitos repetidos es: ',cantper);
  writeln('Presione ENTER para finalizar');
  readln;
end.
