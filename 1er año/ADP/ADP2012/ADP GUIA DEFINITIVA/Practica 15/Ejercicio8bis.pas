program Ejercicio8;

procedure ParesImpares(num:integer; var pares:integer; var impares:integer);
begin
  if (num>0) then
    begin
      if (num mod 2 = 0) then pares:=pares+1
      else impares:=impares + 1;
      num:=num div 10;
      ParesImpares(num, pares, impares);
    end;
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


