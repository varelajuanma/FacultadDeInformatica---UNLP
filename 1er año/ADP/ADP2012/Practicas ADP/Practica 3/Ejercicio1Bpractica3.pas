Program ejer1Bprac3;
var
  car:char;
  cant:integer;
begin
  cant:=0;
  writeln('ingrese un caracter');
  readln(car);
  while (car<>'.') do begin
    cant:=cant + 1;
    readln(car);
  end;
  writeln('la cantidad de caracteres leidos es de:', cant);
  readln;
  readln;
end.
