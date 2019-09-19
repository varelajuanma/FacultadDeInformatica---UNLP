Program ejer8B;
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
function combinatorio (M,N:integer):real;
  var
    dividendo,divisor,resultado:real;
  begin
    dividendo:= factorial(M);
    divisor:= (factorial(M-N) * factorial(N));
    resultado:= dividendo / divisor;
    combinatorio:= resultado;
  end;
var
  M,N:integer;
begin
  write('Ingrese un numero para M: ');
  readln(M);
  write('Ingrese un numero para N: ');
  readln(N);
  writeln('El resultado combinatorio de (',M,' y ',N,') es: ',combinatorio(M,N):2:0);
  writeln('Presione ENTER para finalizar');
  readln;
end.
