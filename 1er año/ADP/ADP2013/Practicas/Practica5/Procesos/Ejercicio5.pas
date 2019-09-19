Program ejer5;
procedure descartarblancos (var car: char);
  begin
    while (car = ' ') do begin
      write('Ingrese un caracter: ');
      readln(car);
      end;
  end;

procedure procesarpalabra (var car: char; var cantvoc,tresvoc:integer);
  type
    conjletras = set of char;
  var
    vocales: conjletras;
  begin
    vocales:= ['a','e','i','o','u','A','E','I','O','U'];
    cantvoc:= 0;
    while (car <> '*') and (car <> ' ') do begin
      if (car IN vocales) then
        cantvoc:= cantvoc + 1;
      write('Ingrese un caracter: ');
      readln(car);
      end;
    if (cantvoc = 3) then
      tresvoc:= tresvoc + 1;
  end;

var
  car: char;
  cantvoc,tresvoc: integer;
begin
  tresvoc:= 0;
  write('Ingrese un caracter: ');
  readln(car);
  descartarblancos(car);
  while (car <> '*') do begin
    procesarpalabra(car,cantvoc,tresvoc);
    descartarblancos(car);
    end;
  writeln('La cantidad de palabras que tienen tres vocales es: ',tresvoc);
  writeln('Presione ENTER para finalizar');
  readln;
end.

