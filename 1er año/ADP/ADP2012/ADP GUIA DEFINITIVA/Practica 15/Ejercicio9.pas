program Ejercicio9;

procedure Binario(n:integer);
var
  m:integer;
begin
  if (n>1)then
    begin
      m:=(n div 2);
      binario(m);
    end;
  writeln(n mod 2);
end;

//Programa principal

var
  n:integer;
begin
  readln(n);
  binario(n);
  readln();
  readln();
end.


