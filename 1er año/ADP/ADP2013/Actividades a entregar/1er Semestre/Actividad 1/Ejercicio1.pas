Program ejercicio1;
var
  autos,dia,ventasmax,ventasmax2,ventasmin,diamin,diamax,diamax2:integer;
begin
  ventasmax:= -1;
  ventasmax2:= -1;
  ventasmin:= 999;
  for dia:= 1 to 5 do begin
    write('Ingrese cantidad de autos vendidos el dia ',dia,': ');
    readln(autos);
    if (autos > ventasmax) then begin
      ventasmax2:= ventasmax;
      ventasmax:= autos;
      diamax2:= diamax;
      diamax:= dia;
      end
    else
      if (autos > ventasmax2) then begin
        ventasmax2:= autos;
        diamax2:= dia;
        end;
    if (autos < ventasmin) then begin
      ventasmin:= autos;
      diamin:= dia;
      end;
    end;
  writeln('El mayor dia de ventas fue el dia: ',diamax);
  writeln('El segundo mayor dia de ventas fue el dia: ',diamax2);
  writeln('La cantidad minima vendida fue de ',ventasmin,' autos, el dia ',diamin);
  writeln('Ingrese ENTER para finalizar');
  readln;
end.
