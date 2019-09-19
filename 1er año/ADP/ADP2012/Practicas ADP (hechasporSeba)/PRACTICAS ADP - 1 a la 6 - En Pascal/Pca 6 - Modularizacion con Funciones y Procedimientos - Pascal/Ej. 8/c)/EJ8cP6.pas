                              {EJ.8c - P6}

{8. �
a- Realice un m�dulo que reciba como par�metro un n�mero entero y calcule
la cantidad de d�gitos impares y la cantidad de d�gitos pares que posee el
n�mero recibido.

c- Utilizando el m�dulo definido en a) realice un programa que lea una
secuencia de n�meros enteros e informe la  cantidad total de d�gitos pares
y la  cantidad total de d�gitos impares que aparece en la secuencia de n�meros.
Ejemplo: 
   1024  5901  6312 249 
Deber�a informar que en total aparecen 8 d�gitos pares y 7 d�gitos impares.    }

{-----------------------------------------------------------------------------}

program Ej8cP6;

               { - - - - INICIO PROCESO DESCOMPONER - - - - }

procedure descomponer (num:integer; var cantpar:integer; var cantimp:integer);
var
  digito: integer;
begin
  while (num <> 0) do begin
    digito:= num mod 10;
    if ((digito mod 2)=0) then
      cantpar:= cantpar + 1
    else
      cantimp:=cantimp + 1;
    num:= num div 10;
  end;
end;

               { - - - - FIN PROCESO DESCOMPONER - - - - }

var
  cantpar: integer;
  cantimpar: integer;
  num: integer;

begin
  cantpar:= 0;
  cantimpar:= 0;
  writeln ('Ingrese un numero : ');
  read (num);
  while (num <> -1) do begin
    descomponer (num,cantpar,cantimpar);
    writeln ('Ingrese un nuevo numero : ');
    read (num);
  end;
  writeln ('La cantidad total de digitos pares son : ', cantpar);
  writeln ('La cantidad total de digitos impares son : ', cantimpar);
  writeln ('Presione ENTER para SALIR');
  readln ();
  readln ();
end.



