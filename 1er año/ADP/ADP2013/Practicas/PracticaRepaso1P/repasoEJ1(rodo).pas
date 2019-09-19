program repasoEJ1;
type
    rango=1..7;
    meses=string[15];
    f=record
            dia:integer;
            mes:meses;
            anio:integer;
      end;
    registro=record
                   parada:integer;
                   estacion:rango;
                   suben:integer;
                   bajan:integer;
                   abordo:integer;
                   hora:real;
                   minutos:integer;
                   fecha:f;
             end;
    vector=array[rango]of integer;
procedure leer(var tren:registro);
begin
     with tren do
     begin
          writeln('ingrese parada');
          readln(parada);
          if (parada <> -1) then
          begin
               writeln('ingrese estacion');
               readln(estacion);
               writeln('ingrese suben');
               readln(suben);
               writeln('ingrese bajan');
               readln(bajan);
               writeln('ingrese hora');
               readln(hora);
               writeln('ingrese minutos');
               readln(minutos);
               writeln('ingrese abordo');
               readln(abordo);
               with fecha do
               begin
                    writeln('ingrese dia');
                    readln(dia);
                    writeln('ingrese mes');
                    readln(mes);
                    writeln('ingrese anio');
                    readln(anio);
               end;
          end;
     end;
end;
procedure iniciar(var tiempo:vector);
var
   i:integer;
begin
     for i:=1 to 7 do
     begin
          tiempo[i]:=0;
     end;
end;
procedure contador(var tiempo:vector; tren:registro);
var
   pos:integer;
begin
      pos:=tren.estacion;
      tiempo[pos]:=tiempo[pos] + tren.minutos;
end;
function max(tiempo:vector):integer;
var
   cantmax:integer;
   i:integer;
begin
     cantmax:=0;
     for i:=1 to 7 do
     begin
          if (tiempo[i] > cantmax) then
          begin
               cantmax:=tiempo[i];
               max:=i;
          end;
     end;
end;
var
   tiempo:vector;
   tren:registro;
   cantidad:integer;
begin
     iniciar(tiempo);
     cantidad:=0;
     writeln('ingrese parada');
     leer(tren);
     while (tren.parada <> -1) do
     begin
          contador(tiempo,tren);
          if (tren.fecha.mes = 'mayo') or (tren.fecha.mes = 'junio') then
             cantidad:=cantidad + tren.suben;
          writeln('ingrese otra parada');
          leer(tren);
     end;
     writeln('la cantidad de personas que suben entre los meses de mayo y junio es: ',cantidad);
     writeln('la estacion donde el tren estuvo mayor tiempo parado es: ',max(tiempo));
     writeln('ingrese ENTER para finalizar');
     readln;
end.
