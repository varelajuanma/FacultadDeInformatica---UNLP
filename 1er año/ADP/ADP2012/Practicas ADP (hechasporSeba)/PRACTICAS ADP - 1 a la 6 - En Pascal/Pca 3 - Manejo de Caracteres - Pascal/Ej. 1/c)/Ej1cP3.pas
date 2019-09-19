{                                  EJ. 1)c)                                    }


program Ej1cP3;
var
  car: char;
  ant: char;
  cantpa: integer;
begin
  cantpa:= 0;
  writeln ('Ingrese un caracter : ');
  readln (car);
  while (car <> '.') do begin
    ant:= car;
    writeln ('Ingrese un caracter : ');
    readln (car);
    if (car = 'a') and (ant= 'p') then
      cantpa:= cantpa + 1;
  end;
  writeln ('La cantidad de letras "p" seguidas por una "a" es : ' ,cantpa);
  writeln ('Presione ENTER para finalizar');
  readln ();
end.










end.
