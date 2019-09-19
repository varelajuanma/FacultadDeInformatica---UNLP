Program ejer3;
type
  conjletras= set of char;
var
  car: char;
  vocales: conjletras;
begin
  vocales:= ['a','e','i','o','u'];
  write('Ingrese un caracter: ');
  readln(car);
  while (car <> '.') do begin
    if (car IN vocales) then
      vocales:= vocales - [car];
    write('Ingrese otro caracter: ');
    readln(car);
    end;
  if ('a' IN vocales) then
    writeln('La vocal "a" no esta en la secuencia');
  if ('e' IN vocales) then
    writeln('La vocal "e" no esta en la secuencia');
  if ('i' IN vocales) then
    writeln('La vocal "i" no esta en la secuencia');
  if ('o' IN vocales) then
    writeln('La vocal "o" no esta en la secuencia');
  if ('u' IN vocales) then
    writeln('La vocal "u" no esta en la secuencia');
  writeln('Presione ENTER para finalizar');
  readln;
end.


