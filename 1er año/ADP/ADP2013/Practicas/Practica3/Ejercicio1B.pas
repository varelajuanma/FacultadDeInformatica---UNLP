Program ejer1b;
var
  car:char;
  cantF:integer;
begin
  cantF:=0;
  write('ingrese caracter: ');
  readln(car);
  while (car <> '.') do begin
    if (car = 'F') then
      cantF:=cantF + 1;
    write('ingrese otro caracter: ');
    readln(car);
    end;
  writeln('la cantidad de F leidos fue de: ',cantF);
  writeln('ingrese ENTER para finalizar');
  readln ();
end.
