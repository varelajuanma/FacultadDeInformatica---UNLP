program asd;
procedure imprimir (var m:integer; n:integer);
begin
  if (m>1) then
    begin
      n:=n-2;
      m:=m-1;
      imprimir (n,m);
      writeln(n);
      writeln(m);
    end;
end;

var
  n,m:integer;
begin
  n:=6;
  m:=9;
  imprimir(n,m);
  writeln(n);
  writeln(m);
  readln();
  readln();
end.


