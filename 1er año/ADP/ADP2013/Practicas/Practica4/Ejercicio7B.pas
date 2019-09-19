Program ejer7B;
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
    case sumadig of
      0: writeln('El resultado es cero');
      1: writeln('El resultado es uno');
      2: writeln('El resultado es dos');
      3: writeln('El resultado es tres');
      4: writeln('El resultado es cuatro');
      5: writeln('El resultado es cinco');
      6: writeln('El resultado es seis');
      7: writeln('El resultado es siete');
      8: writeln('El resultado es ocho');
      9: writeln('El resultado es nueve');
    end;
  end;
  writeln('Se han ingresado diez numeros');
  writeln('Presione ENTER para finalizar');
  readln;
end.
