program Ejercicio8;

procedure ParesImpares(num:integer; var pares:integer; var impares:integer);
begin
  if ((num mod 10) mod 2 = 0 ) then pares:=pares+1
  else impares:=impares+1;
  if (num > 9) then ParesImpares(num div 10, pares,impares);
end;

//Programa principal
var
  num,pares,impares:integer;
begin
  pares:=0;
  impares:=0;
  readln(num);
  ParesImpares(num,pares,impares);
  writeln('Pares: ',pares);
  writeln('Impares: ',impares);
  readln();
  readln();
end.


