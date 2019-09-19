Program ejer10;
function factorial (num:integer):real;
  var
    i:integer;
    res:real;
  begin
    res:= 1;
    for i:= 1 to num do
      res:= res * i;
    factorial:= res;
  end;
function sumatoria (n:integer):real;
  var
    i:integer;
    suma:real;
  begin
    suma:= 0;
    for i:= 1 to n do
      suma:= suma + factorial(i * n);
    sumatoria:= suma;
  end;
function productoria (n:integer):real;
  var
    i:integer;
    prod:real;
  begin
    prod:= 1;
    for i:= 1 to n do
      prod:= prod * (i + (i*i));
    productoria:= prod;
  end;
var
  n:integer;
begin
  write('Ingrese un numero: ');
  readln(n);
  writeln('El resultado es: ',sumatoria(n) - productoria(n):10:0);
  writeln('Presione ENTER para finalizar');
  readln;
end.
