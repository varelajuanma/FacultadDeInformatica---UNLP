Program ejer5;
type
  number= 0 .. 9;
  conjnum= set of number;
var
  num,sumaimp,digito,resto: integer;
  impares: conjnum;
  encontro: boolean;
begin
  impares:= [1,3,5,7,9];
  encontro:= false;
  while (encontro = false) do begin
    sumaimp:= 0;
    write('Ingrese un numero: ');
    readln(num);
    resto:= num;
    while (resto <> 0) do begin
      digito:= num MOD 10;
      if (digito IN impares) then
        sumaimp:= sumaimp + digito;
      resto:= resto DIV 10;
      end;
    if ((sumaimp DIV 3) <> 0) then
      encontro:= true;
    end;
  writeln('La suma de los digitos impares del numero ',num,' son divisibles por 3');
  writeln('Presione ENTER para finalizar');
  readln;
end.
