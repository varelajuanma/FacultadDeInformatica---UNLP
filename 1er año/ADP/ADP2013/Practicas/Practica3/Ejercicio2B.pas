Program ejer2a;
var
  car:char;
  cantM:integer;
begin
  cantM:=0;
  write('Ingrese un caracter: ');
  readln(car);
  while (car = ' ') do begin
    write('ingrese otro caracter: ');
    readln(car);
    end;
  while (car <> '.') do begin
    if (car = 'M') then
      cantM:=cantM + 1;
    while (car <> '.') and (car <> ' ') do begin
      write('ingrese otro caracter: ');
      readln(car);
      end;
    while (car = ' ') do begin
      write('ingrese otro caracter: ');
      readln(car);
      end;
    end;
  writeln('la cantidad de palabras leidas que comienzan con M fue de: ',cantM);
  writeln('ingrese ENTER para finalizar');
  readln;
  readln;
end.
