Program ejer2B;
type
  conjletras= set of char;
var
  car: char;
  cons,voc: conjletras;
  cantcons,cantvoc,cantp: integer;
begin
  cantp:= 0;
  voc:= ['A','E','I','O','U','a','e','i','o','u'];
  cons:= ['A'..'Z','a'..'z'] - voc;
  write('Ingrese un caracter: ');
  readln(car);
  while (car = ' ') do begin
    write('Ingrese un caracter: ');
    readln(car);
    end;
  while (car <> '.') do begin
    cantcons:= 0;
    cantvoc:= 0;
    while (car <> '.') and (car <> ' ') do begin
      if (car IN voc) then
        cantvoc:= cantvoc + 1;
      if (car IN cons) then
        cantcons:= cantcons + 1;
      write('Ingrese un caracter: ');
      readln(car);
      end;
    if (cantvoc = 3) or (cantcons = 5) then
      cantp:= cantp + 1;
    while (car = ' ') do begin
      write('Ingrese un caracter: ');
      readln(car);
      end;
    end;
  writeln('La cantidad de palabras con 3 vocales o 5 consonantes es de: ',cantp);
  writeln('Ingrese ENTER para finalizar');
  readln;
end.
