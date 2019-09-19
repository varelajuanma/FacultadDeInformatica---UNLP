Program ejer1;
Procedure leernum (var cantpar,cantimpar: integer);
  var
    num,digito: integer;
  begin
    write('Ingrese un numero: ');
    readln(num);
    while (num > -1) do begin
      digito:= num MOD 10;
      if ((digito MOD 2) = 0) then begin
        cantpar:= cantpar + 1;
        end
      else
        cantimpar:= cantimpar + 1;
      write('Ingrese un numero: ');
      readln(num);
      end;
  end;
var
  cantpar,cantimpar: integer;
begin
  cantpar:= 0;
  cantimpar:= 0;
  leernum (cantpar,cantimpar);
  writeln('La cantidad de numeros pares fueron: ',cantpar);
  writeln('La cantidad de numeros impares fueron: ',cantimpar);
  writeln('Ingrese ENTER para finalizar');
  readln;
end.
