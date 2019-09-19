program Ejercicio1;

function digitos(num:integer):integer;
begin
  if (num > 0) then digitos:= digitos(num div 10) + 1
  else digitos:=0;
end;

var
  num:integer;
begin
  readln(num);
  writeln (digitos(num));
  readln();
  readln();
end.



