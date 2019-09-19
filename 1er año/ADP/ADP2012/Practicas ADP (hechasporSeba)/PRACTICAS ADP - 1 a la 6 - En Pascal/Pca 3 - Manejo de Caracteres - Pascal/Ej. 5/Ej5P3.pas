{                               EJ. 5                                         }

{5.-  Escriba un programa que lea una secuencia de caracteres terminada en
punto ‘.’ y determine la cantidad de veces que aparece una ‘a’ seguida de una
‘e’ o viceversa.
Nota: Si aparece aeae la cantidad es 3(la primer ae luego ea y finalmente ae) }

program Ej5P3;
var
  car: char;
  ant: char;
  cantae: integer;
begin
  cantae:= 0;
  writeln ('Ingrese una secuencia de caracteres');
  read (car);
  while (car = ' ') do
    read (car);

  while (car <> '.') do begin
      ant:= car;
      read (car);
      if ((ant = 'a') and (car = 'e')) or ((ant = 'e') and (car = 'a')) then
        cantae:= cantae+1;
      while (car = ' ') do
        read (car);
  end;
  writeln ('La cantidad de veces que aparece una "a" seguida de una "e" o viceversa, son : ', cantae);
  writeln ('Presione ENTER para finalizar');
  readln ();
  readln ();
end.




