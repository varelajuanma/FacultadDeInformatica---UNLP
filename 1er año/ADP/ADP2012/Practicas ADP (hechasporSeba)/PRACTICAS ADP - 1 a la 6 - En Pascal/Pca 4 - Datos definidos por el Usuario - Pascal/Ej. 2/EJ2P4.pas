{2.- Escriba un programa que lea una secuencia de caracteres terminada en ‘.’
e informe cuántas palabras tienen (exactamente) 5 consonantes o 3 vocales.
Tenga en cuenta que los caracteres leídos pueden ser mayúsculas o minúsculas.}


program EJ2P4;
type
  caracteres = set of char;

var
  car: char;
  cantcons: integer;
  cantvoc: integer;
  palabras: integer;
  abecedario: caracteres;
  consonantes: caracteres;
  vocales: caracteres;

begin
  abecedario:= ['a'..'z','A'..'Z'];
  vocales:= ['a','e','i','o','u','A','E','I','O','U'];
  consonantes:= abecedario - vocales;
  palabras:= 0;

  writeln ('Ingrese secuencia de caracteres finalizada en . ');
  read (car);

  while (car <> '.') do begin
    while (car = ' ') do
      read (car);
    cantcons:= 0;
    cantvoc:= 0;
    while ((car <> '.') and (car <> ' ')) do begin
      if (car in consonantes) then
        cantcons:= cantcons + 1
      else
        if (car in vocales) then
          cantvoc:= cantvoc + 1;
      read(car)
    end;
    if ((cantcons = 5) or (cantvoc = 3)) then
      palabras:= palabras + 1;
  end;
  writeln ('Las palabras que tienen 5 consonantes o 3 vocales son : ', palabras);
  writeln ('Presione ENTER para finalizar');
  readln ();
  readln ();
end.

