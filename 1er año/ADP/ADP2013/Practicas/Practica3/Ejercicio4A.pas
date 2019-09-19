Program ejer4A;
var
  car:char;
  cantletras,long:integer;
begin
  long:= -1;
  write('Ingrese un caracter: ');
  readln(car);
  while (car = ' ') do begin
    write('Ingrese un caracter: ');
    readln(car);
    end;
  while (car <> '.') do begin
    cantletras:= 0;
    while (car <> '.') and (car <> ' ') do begin
      cantletras:= cantletras + 1;
      write('Ingrese un caracter: ');
      readln(car);
      end;
    if (cantletras > long) then
      long:= cantletras;
    while (car = ' ') do begin
      write('Ingrese un caracter: ');
      readln(car);
      end;
    end;
  writeln('La longitud de la palabra mas larga es de ',long,' letras');
  writeln('Ingrese ENTER para finalizar');
  readln;
end.
