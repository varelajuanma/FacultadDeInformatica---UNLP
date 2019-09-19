{4- Realizar un programa que lea una secuencia de números hasta encontrar
un número en el cual la suma de sus dígitos impares sea divisible por tres.    }

{-----------------------------------------------------------------------------}

program Ej4P4;
var
  num: integer;
  sumaimp: integer;
  digito: integer;
  numero: integer;
  encontro: boolean;
  XIMP: boolean;

begin
  ENCONTRO:= False;
  writeln ('Ingrese un numero');
  read (num);                             {949 =  9+9 = 18, Divisible x 3}
  numero:= num;                       {Me guardo el numero original ingresado}

  while (ENCONTRO=False) do begin
    sumaimp:= 0;
    XIMP:= false;
    while (num > 0) do begin
      digito:= num mod 10;
      if ((digito mod 2)=1) then begin
        sumaimp:= sumaimp + digito;
        XIMP:= True;         {Valida haber encontradoal menos 1 digito impar}
      end;
      num:= num div 10;
    end;
    if ((sumaimp mod 3)=0) and XIMP then begin {Pregunta si la sumaimp es /3}
      encontro:=True;
      writeln ('NUMERO ENCONTRADO, es el = ', numero);
      writeln ('Ingrese E = EXIT para finalizar');
    end
    else
      writeln ('Ingrese un numero');
      read (num);
      numero:= num;
  end;
end.
