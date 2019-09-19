Program ejer7;
function calcular (base,exp:integer):integer;
  var
    pot,i:integer;
  begin
    pot:= 1;
    if (exp > 0) then begin
      for i:= 1 to exp do begin
        pot:= pot * base;
        end;
      calcular:= pot;
      end;
  end;
var
  base,exp: integer;
begin
  write('Ingrese un numero para base: ');
  readln(base);
  write('Ingrese un numero para exponente: ');
  readln(exp);
  writeln('el resultado de ',base,' elevado a la ',exp,' es: ',calcular (base,exp));
  writeln('Presione ENTER para finalizar');
  readln;










end.
