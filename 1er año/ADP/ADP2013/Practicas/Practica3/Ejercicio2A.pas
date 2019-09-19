Program ejer2a;
var
  car:char;
  cantpa:integer;
begin
  cantpa:=0;
  write('Ingrese un caracter: ');
  readln(car);
  while (car = ' ') do begin
    write('ingrese otro caracter: ');
    readln(car);
    end;
  while (car <> '.') do begin
    cantpa:=cantpa + 1;
    while (car <> '.') and (car <> ' ') do begin
      write('ingrese otro caracter: ');
      readln(car);
      end;
    while (car = ' ') do begin
      write('ingrese otro caracter: ');
      readln(car);
      end;
    end;
  writeln('la cantidad de palabras leidas fue de: ',cantpa);
  writeln('ingrese ENTER para finalizar');
  readln;
  readln;
end.
