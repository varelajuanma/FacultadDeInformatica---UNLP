Program ejer2C;
var
  car,ult:char;
  cantS:integer;
begin
  cantS:=0;
  write('ingrese un caracter: ');
  readln(car);
  while (car = ' ') do begin
    write('ingrese un caracter: ');
    readln(car);
    end;
  while (car <> '.') do begin
    while (car <> '.') and (car <> ' ') do begin
      ult:=car;
      write('ingrese un caracter: ');
      readln(car);
      end;
    if (ult = 'S') then
      cantS:=cantS + 1;
    while (car = ' ') do begin
      write('ingrese un caracter: ');
      readln(car);
      end;
    end;
  writeln('la cantidad de palabras que terminan en "S" es de: ',cantS);
  writeln('ingrese ENTER para finalizar');
  readln;
  readln;
end.
