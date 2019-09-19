{                                   EJ. 3)c)                                  }


program Ej3cP3;
var
  car: char;
  terminancons: integer;
  ant: char;

begin
  terminancons:= 0;
  writeln ('Ingrese una secuencia de caracteres');
  read (car);
  while (car = ' ') do
    read (car);

  repeat

    while (car <> 'z') and (car <> ' ') do begin
      ant:= car;
      read (car);
    end;

    if (ant = 's') then
      terminancons := terminancons + 1;

    while (car = ' ') do
      read (car);

  until (car = 'z');
  writeln ('La cantidad de palabras terminadas en "s", son : ', terminancons );
  writeln ('Presione ENTER para finalizar');
  readln ();
  readln ();
end.


