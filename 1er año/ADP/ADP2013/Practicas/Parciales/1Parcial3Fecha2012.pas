Program parcial;
const
  dimF = 5000;
type
  rango = 1 .. 20;
  fecha = record
        dia: 1 .. 31;
        mes: 1 .. 12;
        ano: integer;
        end;
  archivo = record
        nroarchivo:integer;
        fechacreacion:fecha;
        fechaultact:fecha;
        codigoext:rango;
        tamano:integer;
        end;
  vectorarchivos = array [1 .. dimF] of archivo;
  vectorcodigos = array [rango] of integer;

procedure iniciarvectorcodigos (var v2:vectorcodigos);
  var
    i:integer;
  begin
    for i:= 1 to 20 do
      v2[i]:= 0;
  end;

procedure leerarchivo (var arc:archivo);
  begin
    with arc do begin
      write('Ingrese el numero de archivo: ');
      readln(nroarchivo);
      if (nroarchivo <> 0) then begin
        write('Ingrese el dia de creacion: ');
        readln(fechacreacion.dia);
        write('Ingrese el mes de creacion: ');
        readln(fechacreacion.mes);
        write('Ingrese el año de creacion: ');
        readln(fechacreacion.ano);
        write('Ingrese el dia de la ultima actualizacion: ');
        readln(fechaultact.dia);
        write('Ingrese el mes de la ultima actualizacion: ');
        readln(fechaultact.mes);
        write('Ingrese el año de la ultima actualizacion: ');
        readln(fechaultact.ano);
        write('Ingrese el codigo de extension: ');
        readln(codigoext);
        write('Ingrese el tamaño expresado en KB: ');
        readln(tamano);
        end;
      end;
  end;

procedure cargarvectorarchivos (var v1:vectorarchivos; var dimL:integer);
  var
    arc:archivo;
    sumakb:integer;
  begin
    sumakb:= 0;
    leerarchivo (arc);
    while (arc.nroarchivo <> 0) and (sumakb <= 524288) and (dimL < dimF) do begin
      dimL:= dimL + 1;
      v1[dimL]:= arc;
      sumakb:= sumakb + arc.tamano;
      leerarchivo (arc);
      end;
  end;

procedure incisoB (var cantmenoskb,maxpar:integer; var v1:vectorarchivos; i:integer);
  var
    digito,par,impar,num:integer;
  begin
    par:= 0;
    impar:= 0;
    if (v1[i].tamano < 102400) then
      cantmenoskb:= cantmenoskb + 1;
    num:= v1[i].nroarchivo;
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
      maxpar:= maxpar + 1;
  end;

procedure incisoC (var v2:vectorcodigos; var numcod:integer);
  var
    j,maxcant:integer;
  begin
    maxcant:= -1;
    for j:= 1 to 20 do
      if (v2[j] > maxcant) then begin
        maxcant:= v2[j];
        numcod:= j;
        end;
  end;

var
  v1:vectorarchivos;
  v2:vectorcodigos;
  dimL,cantmenoskb,maxpar,numcod,i,codigo,cantsupera:integer;
begin
  dimL:= 0;
  cantmenoskb:= 0;
  maxpar:= 0;
  numcod:= 0;
  cantsupera:= 0;
  iniciarvectorcodigos (v2);
  cargarvectorarchivos (v1,dimL);
  for i:= 1 to dimL do begin
    incisoB (cantmenoskb,maxpar,v1,i);
    codigo:= v1[i].codigoext;
    v2[codigo]:= v2[codigo] + 1;
    if (v1[i].tamano > 6000) then
      cantsupera:= cantsupera + 1;
    end;
  incisoC (v2,numcod);
  writeln('La cantidad de archivos que ocupan menos de 102400 KB es: ',cantmenoskb);
  writeln('La cantidad de archivos cuyo numero posee mas digitos pares que impares es: ',maxpar);
  writeln('El codigo de extension que posee mas archivos es el: ',numcod);
  writeln('El porcentaje de archivos cuyo tamano supera los 6000 KB es: ',((cantsupera * dimL) / 100));
  writeln('Presione ENTER para finalizar');
  readln;
end.
