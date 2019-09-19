Program ejer5;
var
  car:char;
  cantora,cantp:integer;
begin
  cantora:= 0;
  write('Ingrese un caracter: ');
  readln(car);
  while (car = ' ') do begin
    write('Ingrese un caracter: ');
    readln(car);
    end;
  while (car <> '*') do begin
    while (car <> '.') and (car <> ' ') and (car <> '*') do begin
      write('Ingrese un caracter: ');
      readln(car);
      end;
    if (car = ' ') or (car = '.') then
      cantp:= cantp + 1;
    if (car = '.') then begin
      cantora:= cantora + 1;
      writeln('La cantidad de palabras en la ',cantora,' oracion tiene ',cantp, ' palabras.');
      cantp:= 0;
      end;
    while (car = ' ') do begin
      write('Ingrese un caracter: ');
      readln(car);
      end;
    write('Ingrese un caracter: ');
    readln(car);
    end;
  writeln('La cantidad total de oraciones fue de :',cantora);
  writeln('Ingrese ENTER para finalizar');
  readln;
end.

