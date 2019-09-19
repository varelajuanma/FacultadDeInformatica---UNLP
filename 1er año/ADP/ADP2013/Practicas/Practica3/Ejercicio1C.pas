Program ejer1c;
var
  car,ant:char;
  cantFC:integer;
begin
  cantFC:=0;
  write('ingrese caracter: ');
  readln(car);
  while (car <> '.') do begin
    ant:=car;
    write('ingrese otro caracter: ');
    readln(car);
    if (ant = 'F') and (car = 'C') then
      cantFC:=cantFC + 1;
    write('ingrese otro caracter: ');
    readln(car);
    end;
  writeln('la cantidad de FC leidos fue de: ',cantFC);
  writeln('ingrese ENTER para finalizar');
  readln ();
end.
