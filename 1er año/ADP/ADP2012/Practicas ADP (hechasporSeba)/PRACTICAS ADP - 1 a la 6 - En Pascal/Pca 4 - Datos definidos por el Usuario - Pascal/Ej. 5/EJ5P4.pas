{5- Realizar un programa que lea una secuencia de caracteres dividida en
palabras que termina en punto. Informar la cantidad de palabras con al
menos 3 vocales distintas que empiezan y terminan con ‘n’.          }

{-----------------------------------------------------------------------------}

program Ej5P4;
type
  letras = set of char;

var
  vocales: letras;
  palabras: integer;
  cantvoc: integer;
  car: char;
  ant: char;
  primera: char;

begin
  palabras:= 0;

  writeln ('Ingrese secuencia de palabras');
  read (car);
  while (car = ' ') do
    read (car);

  while (car <> '.') do begin         {Condicion general de FIN}
    cantvoc:= 0;
    vocales:= ['a','e','i','o','u'];
    if ( car = 'n') then begin
      primera:= car;
      read (car);
      while ((car <> '.') and (car <> ' ')) do begin
        if (car in vocales) then begin
          cantvoc:= cantvoc + 1;
          vocales:= vocales - [car];
        end;
        ant:= car;
        read (car);
      end;
      if ((primera = 'n') and (ant = 'n') and (cantvoc >= 3)) then
        palabras:= palabras + 1;
    end
    else
      while (car = ' ') do
        read (car);
      while ((car <> '.') and (car <> ' ')) do
        read (car);
      while (car = ' ') do
        read (car);
  end;
  writeln ('PALABRAS que empiezan y terminan con n y tienen al menos 3 vocales distintas : ', palabras);
  writeln ('Presione ENTER para finalizar');
  readln ();
  readln ();
end.


