Program ejer8;
type
  number= 0..255;
  conjnum= set of number;
var
  num,cantnum,digito,cantdig,resul: integer;
  numleidos: conjnum;
begin
  numleidos:= [];
  cantnum:= 0;
  while (cantnum < 10) do begin
    write('Ingrese un numero: ');
    readln(num);
    if (num < 30) then begin
      cantnum:= cantnum + 1;
      numleidos:= numleidos + [num];
      end;
    end;
  writeln('Se ingresaron 10 numeros menores que 30');
  while (not(cantdig IN numleidos)) do begin
    cantdig:= 0;
    write('Ingrese un numero: ');
    readln(num);
    resul:= num;
    while (num <> 0) do begin
      digito:= num MOD 10;
      cantdig:= cantdig + digito;
      num:= num DIV 10;
      end;
    end;
  writeln('El resultado es: ',resul);
  writeln('Presione ENTER para finalizar');
  readln;
end.
