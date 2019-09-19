Program ejer2D;
var
  car,ult,pri:char;
  cantMS:integer;
begin
  cantMS:=0;
  write('ingrese un caracter: ');
  readln(car);
  while (car = ' ') do begin
    write('ingrese un caracter: ');
    readln(car);
    end;
  while (car <> '.') do begin
    if (car = 'M') then
      pri:=car;
    while (car <> '.') and (car <> ' ') do begin
      ult:=car;
      write('ingrese un caracter: ');
      readln(car);
      end;
    if (pri = 'M') and (ult = 'S') then
      cantMS:=cantMS + 1;
    while (car = ' ') do begin
      write('ingrese un caracter: ');
      readln(car);
      end;
    end;
  writeln('la cantidad de palabras que comienzan con "M" y terminan con "S" son: ',cantMS);
  writeln('ingrese ENTER para finalizar');
  readln;
end.
