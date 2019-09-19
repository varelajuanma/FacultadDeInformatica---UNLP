Program ejer4C;
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
  cantpar,cantimpar,num,totalpar,totalimpar: integer;
begin
  totalpar:= 0;
  totalimpar:= 0;
  write('Ingrese un numero: ');
  readln(num);
  while (num <> 0) do begin
    cantpar:= 0;
    cantimpar:= 0;
    calcularnum (cantpar,cantimpar,num);
    totalpar:= totalpar + cantpar;
    totalimpar:= totalimpar + cantpar;
    write('Ingrese un numero: ');
    readln(num);
    end;
  writeln('La cantidad total de numeros pares es: ',totalpar);
  writeln('La cantidad total de numeros impares es: ',totalimpar);
  writeln('Presione ENTER para finalizar');
  readln;
end.

