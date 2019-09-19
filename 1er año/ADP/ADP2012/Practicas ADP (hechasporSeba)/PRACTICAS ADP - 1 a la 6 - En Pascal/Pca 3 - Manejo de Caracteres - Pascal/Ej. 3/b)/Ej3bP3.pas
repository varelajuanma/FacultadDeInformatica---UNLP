{                                EJ. 3)b)                                     }


program Ej3bP3;
var
  car: char;
  cantpalM: integer;

begin
  cantpalM:= 0;
  writeln ('Por favor ingrese la secuencia de caracteres');
  read (car);
  while (car = ' ') do
    read (car);

    repeat
      if (car = 'M') then begin
        cantpalM:= cantpalM + 1;
        read (car);
        while (car <> ' ') and (car <> 'z') do
          read (car);
      end;
      while (car <> ' ') and (car <> 'z') do
        read (car);
      while (car = ' ') do
        read (car)
    until (car = 'z');

    writeln ('La cantidad de palabras que comienzan con M, son :', cantpalM);
    writeln ('Presione ENTER para finalizar');
    readln ();
    readln ();
end.
