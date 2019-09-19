program Ejercicio11;

procedure Mayor (n:integer; var max:integer);
begin
  if (n>0) then
    begin
      if ((n mod 10)> max) then max:=(n mod 10);
      mayor (n div 10,max);
    end
end;

//Programa Principal

var
  n, max:integer;
begin
  readln(n);
  mayor(n,max);
  writeln(max);
  readln();
  readln();
end.
