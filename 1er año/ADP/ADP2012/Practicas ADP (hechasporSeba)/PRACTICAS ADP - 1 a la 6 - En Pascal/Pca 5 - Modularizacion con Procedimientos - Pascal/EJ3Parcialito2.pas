{Palabra = SecuenciA}

program EJ3Parcialito;
type
  letras = set of char;

var
  conjletras: letras;
  cantcaracteres: integer;
  car: char;


begin
  conjletras:= ['S','e','n','t','c','i','A'];
  cantcaracteres:= 0;

  writeln ('Ingrese caracter');
  readln (car);
  while (car <> '?') do begin
    if (car in conjletras) then
      cantcaracteres:= cantcaracteres + 1;
    writeln ('Ingrese otro caracter');
    readln (car);
  end;
  writeln ('Cantidad de caracteres fue : ', cantcaracteres);
  writeln ('Presione ENTER para finalizar');
  readln ();
  readln ();
end.


