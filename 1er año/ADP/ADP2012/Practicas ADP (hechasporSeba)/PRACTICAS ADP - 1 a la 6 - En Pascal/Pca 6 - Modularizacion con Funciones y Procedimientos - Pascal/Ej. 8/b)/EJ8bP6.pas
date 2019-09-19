                              {EJ.8b - P6}

{8. �
a- Realice un m�dulo que reciba como par�metro un n�mero entero y calcule
la cantidad de d�gitos impares y la cantidad de d�gitos pares que posee el
n�mero recibido.                                                               

b- Utilizando el m�dulo definido en a) realice un programa que lea una
secuencia de n�meros enteros e informe la cantidad de n�meros con mayor
cantidad de d�gitos pares.                                                     }

{-----------------------------------------------------------------------------}
program Ej8bP6;

               { - - - - INICIO PROCESO DESCOMPONER - - - - }
procedure descomponer (num:integer; var cantpar:integer; var cantimp:integer);
var
  digito: integer;
begin
  cantpar:= 0;
  cantimp:= 0;
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

procedure evaluar (cantpar:integer; cantimpar:integer; var cantnumeros:integer);
begin
  if (cantpar > cantimpar) then
    cantnumeros:= cantnumeros + 1;
end;

                              //PROGRAMA PRINCIPAL
var
  cantnumeros: integer;
  num: integer;
  cantpar: integer;
  cantimpar: integer;

begin
  cantnumeros:= 0;
  writeln ('Ingrese un numero : ');
  read (num);
  while (num <> 999) do begin
    descomponer (num,cantpar,cantimpar);
    evaluar (cantpar,cantimpar,cantnumeros);
    writeln ('Ingrese nuevamente un numero : ');
    read (num);
  end;
  writeln ('La cantidad de numeros con mayor digitos pares fue de : ', cantnumeros);
  writeln ('Presione ENTER para finalizar');
  readln ();
  readln ();
end.







end.
