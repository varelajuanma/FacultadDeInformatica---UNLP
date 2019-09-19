                            {EJ. 6) d)}


{6.- Escriba una programa que lea una secuencia de caracteres terminada en ‘#’. 
a) Contar la cantidad de palabras de longitud 6 que componen esa secuencia.

d) Idem a) pero además contando la cantidad de palabras que comienzan con ‘MI’
y terminan con ‘CA’.}


program Ej6bP3;
var
  car: char;
  palabrascon6: integer;
  cant: integer;
  palabrasMIyCA: integer;
  primera: char;
  segunda: char;
  anteult: char;
  ultima: char;


begin
  palabrascon6:= 0;
  palabrasMIyCA:= 0;

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
      if (cant=1) then
        primera:= car;          {Evalua 1ras 2 letras}
      if (cant=2) then
        segunda:= car;
      anteult:= ultima;       {Evalua ultimas 2 letras}
      ultima:= car;
      read (car);
    end;
    if ((primera='M') and (segunda='I')) and ((anteult='C') and (ultima='A')) then
      palabrasMIyCA:= palabrasMIyCA + 1;
    if (cant = 6) then
      palabrascon6:= palabrascon6 + 1;
    while (car = ' ') do
      read (car);
  end;
  writeln ('La cantidad de palabras de longitud 6 que fueron ingresadas, son : ', palabrascon6);
  writeln ('La cantidad de palabras que comienzan con MI y terminan con CA, son : ', palabrasMIyCA);
  writeln ('Presione ENTER para finalizar');
  readln ();
  readln ();
end.
