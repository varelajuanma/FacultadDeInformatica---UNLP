                              {EJ.1 - P6}

{1.- Escriba un módulo que reciba un carácter que debe ser un operador
matemático ('*', '+', '-', '/') y dos números enteros, y devuelva el
resultado de realizar la operación matemática entre los dos números recibidos.
En caso que el carácter no sea un operador matemático, el módulo debe devolver
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

