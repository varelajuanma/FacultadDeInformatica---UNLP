program Ej1;
var
i: integer;
autos: integer;
max1: integer;
max2: integer;
min: integer;
diamax1: integer;
diamax2: integer;
diamin: integer;

begin
  max1:= -1;
  max2:= -10;
  min:= 100;
  diamax1:= 0;
  diamax2:= 0;
  diamin:= 0;

  for i:= 1 to 5 do
    begin
      writeln ('Ingrese numero de autos vendidos el dia ' ,i, ' :' );
      read (autos);
      if (autos > max1) then begin
        max2:= max1;
        diamax2:= diamax1;
        max1:= autos;
        diamax1:= i;
      end
      else
        if (autos > max2) then begin
          max2:= autos;
          diamax2:= i;
        end;
    end;
    if (autos < min) then begin
      min:= autos;
      diamin:= i;
    end;
  writeln ('El 1er. dia de mayor venta fue el dia ' ,diamax1,  ' con : ' , max1, ' autos');
  writeln ('El 2do. dia de mayor venta fue el dia ' ,diamax2,  ' con : ' , max2, ' autos');
  writeln ('El dia de menor venta fue el dia ' ,diamin,  ' con : ' , min, ' autos');
  Write('Pulse ENTER para finalizar');
  readln();
  readln();
end.
