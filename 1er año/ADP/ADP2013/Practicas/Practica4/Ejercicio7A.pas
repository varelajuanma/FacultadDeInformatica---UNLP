Program ejer7;
var
  num,digito,sumadig,i: integer;
begin
  for i:= 1 to 10 do begin
    sumadig:= 0;
    write('Ingrese un numero: ');
    readln(num);
    while (num > 0) do begin
      digito:= num MOD 10;
      sumadig:= sumadig + digito;
      num:= num DIV 10;
      end;
    writeln('La suma de los digitos es: ',sumadig);
    while (sumadig > 9) do begin
      num:= sumadig;
      sumadig:= 0;
      while (num > 0) do begin
        digito:= num MOD 10;
        sumadig:= sumadig + digito;
        num:= num DIV 10;
        end;
      end;
    writeln('El resultado es: ',sumadig);
    end;
  writeln('Se han ingresado diez numeros');
  writeln('Presione ENTER para finalizar');
  readln;
end.
