Program ejer9;
var
  car:char;
  num1,num2,resul:real;
begin
  while (car <> 'S') do begin
    write('ingrese primer numero: ');
    readln(num1);
    write('ingrese segundo numero: ');
    readln(num2);
    write('ingrese caracter: ');
    readln(car);
    if (car = '+') then begin
      resul:=num1 + num2;
      end
    else
      if (car = '-') then begin
        resul:=num1 - num2;
        end
      else
        if (car = '*') then begin
          resul:=num1 * num2;
          end
        else
          if (car = '/') then begin
            resul:=num1 / num2;
            end;
    writeln('el resultado es: ',resul);
    end;
  writeln('ingrese ENTER para finalizar');
  readln ();
end.
