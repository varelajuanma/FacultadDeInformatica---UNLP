{                                 EJ 1)b)                                     }



program Ej1bP3;
var
  cantx: integer;
  car: char;

begin
  cantx:= 0;
  writeln ('Ingrese un caracter : ');
  readln (car);
  while (car <> '.') do begin
    if (car = 'X') then
      cantx:= cantx+1;
    writeln ('Ingrese un caracter : ');
    readln (car);
  end;
  writeln ('La cantidad de letras X leidas, es : ' ,cantx);
  writeln ('Presione ENTER para finalizar');
  readln ();
end.
