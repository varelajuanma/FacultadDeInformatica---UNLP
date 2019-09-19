Program ejer4;
var
  codigo,edad,edadmax,masde40,totalpers:integer;
  porcentaje:real;
begin
  edadmax:=0;
  masde40:=0;
  totalpers:=0;
  repeat
    write('ingrese codigo de encuesta: ');
    read(codigo);
    write('ingrese edad de la persona encuestada: ');
    read(edad);
    if (edad > edadmax) then
      edadmax:=edad;
    if (edad > 40) then
      masde40:= masde40 + 1;
    totalpers:= totalpers + 1;
    until (codigo = 0);
  porcentaje:= masde40/totalpers;
  writeln('la edad maxima entre los encuestados fue de :',edadmax);
  writeln('el porcentaje de las personas con mas de 40 años es de :',porcentaje);
  readln;
  readln;
end.
