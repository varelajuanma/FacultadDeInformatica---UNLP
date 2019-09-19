Program ejer6;
var
  num,digito,sumadig,maxdig: integer;
begin
  write('Ingrese un numero: ');
  readln(num);
  while (num <> 8888) do begin
    maxdig:= -1;
    sumadig:= 0;
    while (num <> 0) do begin
      digito:= num MOD 10;
      sumadig:= sumadig + digito;
      if (digito > maxdig) then
        maxdig:= digito;
      num:= num DIV 10;
      end;
    writeln('El digito mayor del numero ingresado es el: ',maxdig);
    writeln('La suma de todos los digitos del numero es: ',sumadig);
    write('Ingrese un numero: ');
    readln(num);
    end;
  writeln('Presione ENTER para finalizar');
  readln;
end.
