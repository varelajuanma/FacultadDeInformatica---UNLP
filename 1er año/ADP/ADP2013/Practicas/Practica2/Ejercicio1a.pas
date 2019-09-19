Program ejer1a;
var
  base:real;
  altura:real;
  area:real;
  perimetro:real;
begin
  area:=0;
  perimetro:=0;
  write('Ingrese valor de la base:');
  read(base);
  write('Ingrese valor de la altura:');
  read(altura);
  area:= base*altura;
  perimetro:= (base+altura)*2;
  writeln('El area del rectangulo es: ',area);
  writeln('El perimetro del rectangulo es: ',perimetro);
  readln;
  readln;
end.
