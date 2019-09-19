                              {EJ.1 - P6}

{1.- Escriba un m�dulo que reciba un car�cter que debe ser un operador
matem�tico ('*', '+', '-', '/') y dos n�meros enteros, y devuelva el
resultado de realizar la operaci�n matem�tica entre los dos n�meros recibidos.
En caso que el car�cter no sea un operador matem�tico, el m�dulo debe devolver
el valor -1.                                                                   }

{-----------------------------------------------------------------------------}

program Ej1P6;
var
  num1:real;
  num2:real;
  car:char;

                      { - - - - INICIO DE FUNCION - - - - }
function operacion (car: char; num1: real; num2: real) : real;
var
  res: real;
begin
  case car of
    '+': begin res:= ((num1) + (num2)) end;
    '-': begin res:= ((num1) - (num2)) end;
    '*': begin res:= ((num1) * (num2)) end;
    '/': begin res:= ((num1) / (num2)) end;
  else
    res:= -1;
    operacion:= res;
  end;
operacion:= res;
end;

                      { - - - - FIN DE FUNCION - - - - }

                        { - - PROGRAMA PRINCIPAL - - }

begin
  writeln ('Ingrese un caracter (operador)');
  read (car);
  writeln ('Ingrese numero correspondiente a NUM 1 : ');
  read (num1);
  writeln ('Ingrese numero correspondiente a NUM 2 : ');
  read (num2);
  writeln ('RESULTADO DE LA OPERACION ES : ', operacion(car,num1,num2):2:2);
  write ('Ingrese ENTER para finalizar');
  readln();
  readln();
end.

