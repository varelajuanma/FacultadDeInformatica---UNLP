{6.- Se lee una sucesión de números enteros terminados en 8888.
Obtener e informar:     
a) la suma de todas las unidades. 
b) el dígito mayor en cada número

Ejemplo: se lee 2   132   4201   372   23025   8888 (no se procesa)
La respuesta será: a) 12 b)  2  3  4  7  5  }

{-----------------------------------------------------------------------------}

program Ej6P4;

var
  num: integer;
  sumauds: integer;
  digitomayor: integer;
  dig: integer;

begin
  sumauds:= 0;

  writeln ('Ingrese un numero : ');
  read (num);  {Ingreso 1er. Nro. = 923}

  while (num <> 8888) do begin
    digitomayor:= -1;
    dig:= num mod 10;
    sumauds:= sumauds + dig;
    while (num > 0) do begin
      dig:= num mod 10;
      if (dig > digitomayor) then
        digitomayor:= dig;
      num:= num div 10;
    end;
    writeln ('b) : ', digitomayor);
    writeln ('Ingrese otro numero');
    read (num);  {otro numero}
  end;
  writeln ('a) : ', sumauds);
  writeln ('Presione ENTER para finalizar');
  readln ();
  readln ();
end.


