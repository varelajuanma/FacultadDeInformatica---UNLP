                                   {EJ. 6) c)}

{6.- Escriba una programa que lea una secuencia de caracteres terminada en ‘#’.
a) Contar la cantidad de palabras de longitud 6 que componen esa secuencia.

c) Idem a) pero además contando la cantidad de palabras que finalizan con ‘SA’.}

program Ej6cP3;
var
  car: char;
  palabrascon6: integer;
  cant: integer;
  terminanconSA: integer;
  anteult: char;
  ultima: char;


begin
  palabrascon6:= 0;
  terminanconSA:= 0;
  writeln ('Ingrese una secuencia de caracteres');
  read (car);

  while (car = ' ') do
    read (car);

  while (car <> '#') do begin
    cant:= 0;
    anteult:= ' ';
    ultima:= ' ';

    while (car <> ' ') and (car <> '#') do begin
      cant:= cant + 1;
      anteult:= ultima;
      ultima:= car;
      read (car);
    end;
    if ((anteult='S') and (ultima='A')) then
      terminanconSA:= terminanconSA + 1;

    if (cant = 6) then
      palabrascon6:= palabrascon6 + 1;
    while (car = ' ') do
      read (car);
  end;
  writeln ('La cantidad de palabras de longitud 6 que fueron ingresadas, son : ', palabrascon6);
  writeln ('La cantidad de palabras que terminan con SA, son : ', terminanconSA);
  writeln ('Presione ENTER para finalizar');
  readln ();
  readln ();
end.


