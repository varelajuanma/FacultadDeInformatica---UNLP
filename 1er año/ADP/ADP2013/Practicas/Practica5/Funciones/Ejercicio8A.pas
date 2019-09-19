Program ejer8A;
function factorial (A:integer):real;
  var
    i: integer;
    res:real;
  begin
    res:= 1;
    for i:= 1 to A do
      res:= res * i;
    factorial:= res;
  end;
var
  A: integer;
begin
  write('Ingrese un numero: ');
  readln(A);
  writeln('El factorial de ',A,' es: ', factorial(A):2:0);
  writeln('Presione ENTER para finalizar');
  readln;
end.
