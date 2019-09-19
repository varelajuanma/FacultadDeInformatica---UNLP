Program ejer1;
type
  rango = 1 .. 7;
  meses = string [15];
  fechas = record
         dia: 1 .. 31;
         mes:meses;
         ano:integer;
         end;
  horario = record
         hora:integer;
         minutos:integer;
         end;
  parada = record
         nroparada:integer;
         nroestacion:rango;
         fecha:fechas;
         horadetenido:horario;
         persabordo:integer;
         persabordan:integer;
         persdescienden:integer;
         end;
  vectornroestacion = array [rango] of integer;

procedure iniciarvectornroestacion (var v:vectornroestacion);
  var
    i:integer;
  begin
    for i:= 1 to 7 do
      v[i]:= 0;
  end;

procedure leerparada (var par:parada);
  begin
    with par do begin
      write('Ingrese el numero de parada: ');
      readln(nroparada);
      if (nroparada <> -1) then begin
        write('Ingrese el numero de estacion: ');
        readln(nroestacion);
        writeln('Ingrese la fecha');
        write('Dia: ');
        readln(fecha.dia);
        write('Mes: ');
        readln(fecha.mes);
        write('Ano: ');
        readln(fecha.ano);
        writeln('Ingrese el horario que estuvo detenido');
        write('Hora: ');
        readln(horadetenido.hora);
        write('Minutos: ');
        readln(horadetenido.minutos);
        write('Ingrese la cantidad de personas a bordo: ');
        readln(persabordo);
        write('Ingrese la cantidad de personas que abordan: ');
        readln(persabordan);
        write('Ingrese la cantidad de personas que descienden: ');
        readln(persdescienden);
        end;
      end;
  end;

procedure incisoB (var v:vectornroestacion; var nroest:integer);
  var
    i,maxhora:integer;
  begin
    maxhora:= 0;
    for i:= 1 to 7 do
      if (v[i] > maxhora) then begin
        maxhora:= v[i];
        nroest:= i;
        end;
  end;

var
  v:vectornroestacion;
  par:parada;
  nroest,totalper,parad:integer;
begin
  totalper:= 0;
  iniciarvectornroestacion (v);
  leerparada (par);
  while (par.nroparada <> -1) do begin
    if (par.fecha.mes = 'mayo') or (par.fecha.mes = 'junio') then
      totalper:= par.persabordan;
    parad:= par.nroestacion;
    v[parad]:= v[parad] + par.horadetenido.hora + par.horadetenido.minutos;
    leerparada (par);
    end;
  incisoB (v,nroest);
  writeln('La cantidad total de personas que abordan entre Mayo y Junio son: ',totalper);
  writeln('La estacion en la que el tren estuvo mas tiempo detenido es la: ',nroest);
  writeln('Presione ENTER para finalizar');
  readln;
end.
