Program ejerc5prac3;
var
  car:char;
  ant:char;
  cant:integer;
begin
  cant:=0;
  writeln('ingrese una secuencia de caracteres');
  readln(car);
  while (car = ' ') do
    readln(car);
  while (car <> '.') do begin
    ant:=car;
    readln(car);
    if (ant='a') and (car='e') then
      cant:=cant + 1;
    if (ant='e') and (car='a') then
      cant:=cant + 1;
  end;
  writeln('la cantidad de caracteres "ae" o "ea" es de', cant);
  readln;
  readln;
end.
