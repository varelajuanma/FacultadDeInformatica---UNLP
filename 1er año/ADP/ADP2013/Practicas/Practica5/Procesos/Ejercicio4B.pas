Program ejer4b;
procedure calcularnum (var cantpar,cantimpar: integer; num:integer);
  type
    number = 0 .. 9;
    conjnum = set of number;
  var
    digito: integer;
    pares: conjnum;
  begin
    pares:= [0,2,4,6,8];
    while (num <> 0) do begin
      digito:= num MOD 10;
      if (digito IN pares) then begin
        cantpar:= cantpar + 1;
        end
      else
        cantimpar:= cantimpar + 1;
      num:= num DIV 10;
      end;
  end;
var
  cantpar,cantimpar,num,maxpar,cantnum: integer;
begin
  cantnum:= 0;
  maxpar:= 0;
  while (cantnum < 5) do begin
    write('Ingrese un numero: ');
    readln(num);
    cantnum:= cantnum + 1;
    cantpar:= 0;
    cantimpar:= 0;
    calcularnum (cantpar, cantimpar, num);
    if (cantpar > cantimpar) then
      maxpar:= maxpar + 1;
    end;
  writeln('La cantidad de numeros que tienen mas digitos pares que impares es: ',maxpar);
  writeln('Presione ENTER para finalizar');
  readln;
end.
