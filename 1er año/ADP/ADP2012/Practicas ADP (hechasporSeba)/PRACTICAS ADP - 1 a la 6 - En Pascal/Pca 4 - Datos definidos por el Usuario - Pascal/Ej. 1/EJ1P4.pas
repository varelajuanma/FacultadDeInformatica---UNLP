{1.- Escriba un programa que lea una secuencia de caracteres terminada en ‘!’
e informe cuántas letras mayúsculas, cuantas letras minúsculas y cuantos
caracteres númericos hay en la secuencia.}


program EJ1P4;
type
  caracteres = set of char;

var
  conjmayusc: caracteres;
  conjminusc: caracteres;
  conjnumeros: caracteres;
  car: char;
  cantmayusc: integer;
  cantminusc: integer;
  cantnumeros: integer;

begin
  conjmayusc:= ['A'..'Z'];
  conjminusc:= ['a'..'z'];
  conjnumeros:= ['0'..'9'];
  cantmayusc:= 0;
  cantminusc:= 0;
  cantnumeros:= 0;

  writeln ('Ingrese un caracter : ');
  readln (car);
  while (car <> '!') do begin
    if (car in conjmayusc) then
      cantmayusc:= cantmayusc + 1
    else
      if (car in conjminusc) then
        cantminusc:= cantminusc + 1
    else
      if (car in conjnumeros) then
        cantnumeros:= cantnumeros + 1;
    writeln ('Ingrese un caracter : ');
    readln (car);
  end;

  writeln ('Se ingresaron ', cantmayusc, ' caracteres MAYUSCULAS');
  writeln ('Se ingresaron ', cantminusc, ' caracteres MINUSCULAS');
  writeln ('Se ingresaron ', cantnumeros, ' caracteres NUMERICOS');
  writeln ('Presione ENTER para finalizar');
  readln ();
end.


