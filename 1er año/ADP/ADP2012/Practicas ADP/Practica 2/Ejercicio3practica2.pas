Program ejer3prac2;
var
  num:integer;
  edad:integer;
  edadmax:integer;
  masde40:integer;
  cantper:integer;
  porcentaje:real;
begin
  edadmax:=0;
  masde40:=0;
  cantper:=0;
  porcentaje:=0;
  writeln('escriba el numero de codigo');
  readln(num);
  while (num <> 999) do begin
    writeln('ingrese la edad de la persona');
    readln(edad);
    if (edad > edadmax) then
      edadmax:=edad;
    if (edad > 40) then
      masde40:= masde40 + 1;
    cantper:=cantper + 1;
    writeln('vuelva a escribir otro codigo');
    readln(num);
  end;
  porcentaje:=(cantper*masde40)/100;
  writeln('la edad maxima encontradad es de:' ,edadmax);
  writeln('el porcentaje de personas con mas de 40 años es de:' ,porcentaje);
  readln;
  readln;
end.
