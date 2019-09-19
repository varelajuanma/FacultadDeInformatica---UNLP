Program ejer3;
var
  autos,dia,max2,max,min,diamin:integer;
begin
  max:=-1;
  max2:=-1;
  min:=999;
  for dia:=1 to 30 do begin
    write('ingrese cantidad de autos vendidos el dia ',dia,' :');
    read(autos);
    if (autos > max) then begin
      max2:=max;
      max:=autos;
      end
    else
      if(autos > max2) then
        max2:=autos;
    end;
    if(autos < min) then begin
      min:=autos;
      diamin:=dia;
      end;
  writeln('la mayor cantidad de ventas fue de :',max);
  writeln('la segunda mayor cantidad de ventas fue de :',max2);
  writeln('la menor cantidad de ventas fue de ',min,' el dia ',diamin);
  readln;
  readln;
end.
