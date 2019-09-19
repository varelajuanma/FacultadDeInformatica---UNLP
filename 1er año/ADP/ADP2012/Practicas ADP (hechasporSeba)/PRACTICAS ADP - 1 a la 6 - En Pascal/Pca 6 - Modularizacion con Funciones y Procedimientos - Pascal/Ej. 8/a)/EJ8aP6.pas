                              {EJ.8a - P6}

{8. –
a- Realice un módulo que reciba como parámetro un número entero y calcule
la cantidad de dígitos impares y la cantidad de dígitos pares que posee el
número recibido.                                                               }

{-----------------------------------------------------------------------------}

program Ej8aP6;

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

var
  cantpar: integer;
  cantimpar: integer;
  num: integer;

begin
  writeln ('Ingrese un numero : ');
  read (num);
  while (num <> -1) do begin
    descomponer (num,cantpar,cantimpar);
    writeln ('El numero ingresado tiene ', cantpar, ' numeros pares ');
    writeln ('El numero ingresado tiene ', cantimpar, ' numeros impares ');
    writeln ('Ingrese un nuevo numero : ');
    read (num);
  end;
  writeln ('Presione ENTER para SALIR');
  readln ();
  readln ();
end.



