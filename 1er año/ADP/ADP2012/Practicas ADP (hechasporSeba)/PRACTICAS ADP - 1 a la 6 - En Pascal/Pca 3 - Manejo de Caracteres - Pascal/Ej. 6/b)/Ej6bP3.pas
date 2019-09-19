{6.- Escriba una programa que lea una secuencia de caracteres terminada en ‘#’. 

a) Contar la cantidad de palabras de longitud 6 que componen esa secuencia. 

b) Idem a) pero además contando la cantidad de palabras que comienzan con ‘PA’.}


program Ej6bP3;
var
  car: char;
  palabrascon6: integer;
  cant: integer;
  palabrasPA: integer;
  primera: char;
  segunda: char;


begin
  palabrascon6:= 0;
  palabrasPA:= 0;

  writeln ('Ingrese una secuencia de caracteres');
  read (car);

  while (car = ' ') do
    read (car);

  while (car <> '#') do begin
    cant:= 0;
    while (car <> ' ') and (car <> '#') do begin
      cant:= cant + 1;
      if (cant=1) then
        primera:= car;
      if (cant=2) then
        segunda:= car;
      read (car);
    end;
    if ((primera='P') and (segunda='A')) then
      palabrasPA:= palabrasPA + 1;
    if (cant = 6) then
      palabrascon6:= palabrascon6 + 1;
    while (car = ' ') do
      read (car);
  end;
  writeln ('La cantidad de palabras de longitud 6 que fueron ingresadas, son : ', palabrascon6);
  writeln ('La cantidad de palabras que comienzan con PA, son : ', palabrasPA);
  writeln ('Presione ENTER para finalizar');
  readln ();
  readln ();
end.
