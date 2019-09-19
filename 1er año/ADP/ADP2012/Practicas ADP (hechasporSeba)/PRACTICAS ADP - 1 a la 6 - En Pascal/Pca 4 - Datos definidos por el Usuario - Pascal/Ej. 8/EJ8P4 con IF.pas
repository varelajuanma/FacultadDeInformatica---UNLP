{8.- Se leen enteros hasta conseguir 10 números menores que 30.
Luego se leen valores enteros hasta que la suma de los dígitos de uno de
los valores leídos, sea igual a alguno de los 10 valores inicialmente leídos.
Informar el número que cumplió esta condición.
Ejemplo:

valores iniciales:     1   6   25   18   23    2    6    19   14   13
                               9425
                               340
                               991       Imprimir 991                         }

{-----------------------------------------------------------------------------}

program Ej8P4;
type
  rango = 0..30;
  conjuntonum = set of rango;

var
  num: integer;
  conjn: conjuntonum;
  numX: integer;
  digito: integer;
  suma: integer;
  cant: integer;
  encontro: boolean;

begin
  encontro:= false;
  conjn:= [];
  cant:= 0;  {0 o 1  ?¿}

  while (cant < 10) do begin
    writeln ('INGRESE NUMEROS : ');
    read (num);                    {Leo 10 numeros < 30 y los guardo en conjn}
    if (num <= 30) then begin
      conjn:= conjn + [num];
      cant:= cant + 1;
    end;
  end;

  writeln ('Ingrese un numero para ser evaluado: ');
  read (num);

  while (encontro = false) do begin
    suma:= 0;
    numx:= num;
    while (num > 0) do begin
      digito:= num mod 10;
      suma:= suma + digito;
      num:= num div 10;
    end;
    if (suma in conjn) then begin
      encontro:= true;
      writeln ('El numero encontrado es : ', numx);
      writeln ('Ingrese E = EXIT para finalizar');
      readln ();
    end
    else
      writeln ('Ingrese numero (del ELSE) : ');
      read (num);
  end;
end.
