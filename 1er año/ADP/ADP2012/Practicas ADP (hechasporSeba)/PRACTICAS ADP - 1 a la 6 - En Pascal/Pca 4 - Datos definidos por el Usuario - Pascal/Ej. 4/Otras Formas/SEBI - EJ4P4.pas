{4- Realizar un programa que lea una secuencia de n�meros hasta encontrar
un n�mero en el cual la suma de sus d�gitos impares sea divisible por tres.    }

{-----------------------------------------------------------------------------}

program Ej4P4;
var
  num: integer;
  digito: integer;
  impares: integer;

begin
  impares:= 1;
  while (impares mod 3 > 0) do begin
    impares:= 0;
    writeln ('Ingrese un numero : ');
    read (num);
    while (num > 0) do begin
      digito:= num mod 10;
      if ((digito mod 2)=1) then
        impares:= impares + digito;
      if impares > 0 then
        if (impares > 0) and (num > 1)
        num:= num div 10;
    end;
  end;
  writeln (' ! ! ! Encontro Numero ! ! ! divisible por 3 ');
  writeln ('Presione ENTER para finalizar');
  readln ();
  readln ();
end.



