                                   {EJ. 6) a)}


{6.- Escriba una programa que lea una secuencia de caracteres terminada en ‘#’.

a) Contar la cantidad de palabras de longitud 6 que componen esa secuencia.}

program Ej6aP3;
var
  car: char;
  palabrascon6: integer;
  cant: integer;

begin
  palabrascon6:= 0;
  writeln ('Ingrese una secuencia de caracteres');
  read (car);

  while (car = ' ') do
    read (car);

  while (car <> '#') do begin
    cant:= 0;
    while (car <> ' ') and (car <> '#') do begin
      cant:= cant + 1;
      read (car);
    end;
    if (cant = 6) then
      palabrascon6:= palabrascon6 + 1;
    while (car = ' ') do
      read (car);
  end;
  writeln ('La cantidad de palabras de longitud 6 que fueron ingresadas, son : ', palabrascon6);
  writeln ('Presione ENTER para finalizar');
  readln ();
  readln ();
end.


