                    {EJERCICIO 3 - TEORIA 4}

{3. Escriba un programa que lea un texto, que termina con punto.
Contar las palabras que contengan al menos cuatro vocales.}

program Ej3T4;
type
  letras = set of char;

var
  vocales: letras;
  cantvoc: integer;
  palabras: integer;
  letra: char;

begin
  palabras:= 0;
  vocales:= ['a', 'e', 'i', 'o', 'u'];
  writeln ('Ingrese una palabra');
  read (letra);
  while (letra = ' ') do
    read (letra);

  while (letra <> '.') do begin
    cantvoc:= 0;
    while ((letra <> '.') and (letra <> ' ')) do begin
      if (letra in vocales) then
        cantvoc:= cantvoc + 1;
      read (letra);
    end;
    if (cantvoc >= 4) then
      palabras:= palabras + 1;
    while (letra = ' ') do
      read (letra);
  end;
  writeln ('La cantidad de palabras ingresadas con 4 vocales como minimo, fueron : ', palabras);
  writeln ('Presione ENTER para finalizar');
  readln ();
  readln ();
end.

