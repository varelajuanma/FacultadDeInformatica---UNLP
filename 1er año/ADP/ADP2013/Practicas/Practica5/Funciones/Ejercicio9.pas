Program ejer9;
function operadormat(N1,N2:integer; car:char):real;
  var
    res: real;
  begin
    if (car = '+') then begin
      res:= N1 + N2;
      end
    else
      if (car = '-') then begin
        res:= N1 - N2;
        end
      else
        if (car = '/') then begin
          res:= N1 / N2;
          end
        else
          if (car = '*') then begin
            res:= N1 * N2;
            end
          else
            res:= -1;
    operadormat:= res;
  end;
var
  N1,N2: integer;
  car: char;
begin
  write('Ingrese primer numero: ');
  readln(N1);
  write('Ingrese operador matematico: ');
  readln(car);
  write('Ingrese segundo numero: ');
  readln(N2);
  writeln('El resultado de la operacion es: ',operadormat(N1,N2,car):2:0);
  writeln('Presione ENTER para finalizar');
  readln;
end.
