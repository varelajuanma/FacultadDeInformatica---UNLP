Program parcial;
const
  dimF = 700;
type
  cadena30 = string [30];
  rango = 1 .. 4;
  persona = record
          DNI:integer;
          apellido:cadena30;
          nombre:cadena30;
          edad:integer;
          codigo:rango;
          end;
  vectorconcurso = array [1 .. dimF] of persona;
  vectorcodigo = array [rango] of integer;

procedure iniciarvectorcodigo (var v2:vectorcodigo);
  var
    i:integer;
  begin
    for i:= 1 to 4 do
      v2[i]:= 0;
  end;

procedure leerpersona (var per:persona);
  begin
    with per do begin
      write('Ingrese el DNI: ');
      readln(DNI);
      if (DNI <> 0) then begin
        write('Ingrese el apellido: ');
        readln(apellido);
        write('Ingrese el nombre: ');
        readln(nombre);
        write('Ingrese la edad: ');
        readln(edad);
        write('Ingrese el codigo de cargo que quiere ocupar: ');
        readln(codigo);
        end;
      end;
  end;

procedure cargarvectorconcurso (var v1:vectorconcurso; var dimL:integer);
  var
    per:persona;
  begin
    leerpersona (per);
    while (per.DNI <> 0) and (dimL < dimF) do begin
      dimL:= dimL + 1;
      v1[dimL]:= per;
      leerpersona (per);
      end;
  end;

procedure incisoB (var v1:vectorconcurso; var cantper:integer; i:integer);
  var
    digito,par,impar,num:integer;
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
      cantper:= cantper + 1;
  end;

procedure incisoC (var v2:vectorcodigo; var codmin1,codmin2:integer);
  var
    min1,min2,j:integer;
  begin
    min1:= 999;
    min2:= 999;
    for j:= 1 to 4 do begin
      if (v2[j] < min1) then begin
        min1:= v2[j];
        codmin1:= j;
        min2:= min1;
        codmin2:= codmin1;
        end
      else
        if (v2[j] < min2) then begin
          min2:= v2[j];
          codmin2:= j;
          end;
      end;
  end;

var
  v1:vectorconcurso;
  v2:vectorcodigo;
  cantper,i,codmin1,codmin2,sumaedad,codig,dimL:integer;
begin
  cantper:= 0;
  codmin1:= 0;
  codmin2:= 0;
  sumaedad:= 0;
  iniciarvectorcodigo (v2);
  cargarvectorconcurso (v1,dimL);
  for i:= 1 to dimL do begin
    if (v1[i].edad > 20) and (v1[i].edad < 30) then
      sumaedad:= sumaedad + 1;
    incisoB (v1,cantper,i);
    codig:= v1[i].codigo;
    v2[codig]:= v2[codig] + 1;
    end;
  incisoC (v2,codmin1,codmin2);
  writeln('El porcentaje de personas con edad entre 20 y 30 años es: ',(sumaedad * dimL) DIV 100);
  writeln('La cantidad de personas con mas digitos pares que impares en su DNI es: ',cantper);
  writeln('El primer codigo de cargo menos elegido es el: ',codmin1);
  writeln('El segundo codigo de cargo menos elegido es el: ',codmin2);
  writeln('Presione ENTER para finalizar');
  readln;
end.
