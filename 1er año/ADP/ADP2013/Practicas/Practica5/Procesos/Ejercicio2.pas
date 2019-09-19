Program ejer2;
procedure leercaracteres (var cantC:integer; c:char);
  var
    car: char;
  begin
    write('Ingrese un caracter: ');
    readln(car);
    while (car <> '.') do begin
      if (car = c) then
        cantC:= cantC + 1;
      write('Ingrese un caracter: ');
      readln(car);
      end;
  end;
var
  cantC: integer;
  c: char;
begin
  cantC:= 0;
  write('Ingrese caracter a contar: ');
  readln(c);
  leercaracteres (cantC, c);
  writeln('La cantidad de veces que aparece la letra ',c,' es: ',cantC);
  writeln('Presione ENTER para finalizar');
  readln;
end.
