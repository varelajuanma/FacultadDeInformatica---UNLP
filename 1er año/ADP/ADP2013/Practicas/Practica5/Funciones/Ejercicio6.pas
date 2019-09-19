Program ejer6;
function esimpar (A:integer):boolean;
  begin
    if ((A MOD 2) = 1) then begin
      esimpar:= true;
      end
    else
      esimpar:= false;
  end;
var
  A:integer;
begin
  write('Ingrese un numero: ');
  readln(A);
  writeln('El numero ',A,' es impar?: ',esimpar(A));
  writeln('Presione ENTER para finalizar');
  readln;
end.
