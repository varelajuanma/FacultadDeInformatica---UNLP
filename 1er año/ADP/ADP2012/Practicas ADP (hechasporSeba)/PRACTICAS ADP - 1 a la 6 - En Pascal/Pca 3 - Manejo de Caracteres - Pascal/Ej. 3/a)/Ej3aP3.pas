{3.- a) Se lee una secuencia de caracteres terminada en 'z', el cual debe
procesarse.
Determinar la cantidad de palabras que componen esta secuencia.
Ejemplo:

elbbmagobdebbbboz                      tiene 4 palabras
éstaboraciónbbbterminabenbbz           tiene 5 palabras                    }

program Ej3aP3;
var
  car: char;
  cantpal: integer;

begin
  cantpal:= 0;

  writeln ('Por favor ingrese la secuencia de caracteres');
  read (car);
  while (car = ' ') do
    read (car);

  repeat
    cantpal:= cantpal + 1;
    while (car <> ' ') and (car <> 'z') do
      read (car);
    while (car = ' ') do
      read (car);
    until (car = 'z');

  writeln('La cantidad de palabras leidas son: ', cantpal);
  writeln ('Presione ENTER para finalizar');
  readln ();
  readln ();
end.

