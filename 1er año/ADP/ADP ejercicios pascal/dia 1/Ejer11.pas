Program ejer11;
procedure sumarN (var suma:integer; n,i:integer);
  begin
    suma:= suma + i;
    if (i < n) then begin
      i:= i + 1;
      sumarN(suma,n,i);
      end;
  end;
var
  suma,n,i:integer;
begin
  i:= 1;
  suma:= 0;
  write('Ingrese un numero natural: ');
  readln (n);
  sumarN(suma,n,i);
  writeln('La suma de los numeros es: ',suma);
  writeln('Ingrese ENTER para finalizar');
  readln();
end.
