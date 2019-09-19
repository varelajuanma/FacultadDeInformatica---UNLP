Program ejer1b;
var
  base:integer;
  altura:integer;
  area:integer;
  perimetro:integer;
  i:integer;
begin
  area:=0;
  perimetro:=0;
  for i:=1 to 20 do begin
    write('ingrese valor de base del rectangulo N',i, ':');
    read(base);
    write('ingrese valor de la altura del rectangulo N',i, ':');
    read(altura);
    area:=base*altura;
    perimetro:=(base+altura)*2;
    writeln('el area del rectangulo es: ',area);
    writeln('el perimetro del rectangulo es: ',perimetro);
    end;
  readln;
  readln;
end.
