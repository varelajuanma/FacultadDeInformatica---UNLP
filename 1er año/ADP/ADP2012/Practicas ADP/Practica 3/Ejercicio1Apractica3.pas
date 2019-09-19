Program ejer1Cprac3;
var
  car:char;
  ant:char;
  cant:integer;
begin
  cant:=0;
  writeln('ingrese un caracter');
  readln(car);
  while (car<>'.') do begin
    ant:=car;
    readln(car);
    if (ant='p') and (car='a') then
      cant:=cant + 1;
  end;
  writeln('la cantidad de caracteres leidos es de:', cant);
  readln;
  readln;
end.
