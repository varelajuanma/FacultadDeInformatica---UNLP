Program ejer4B;
var
  car,pri:char;
  cantl,long:integer;
begin
  long:= -1;
  write('Ingrese un caracter: ');
  readln(car);
  while (car = ' ') do begin
    write('Ingrese un caracter: ');
    readln(car);
    end;
  while (car <> '.') do begin
    cantl:= 0;
    pri:= car;
    while (car <> '.') and (car <> ' ') do begin
      cantl:= cantl + 1;
      write('Ingrese un caracter: ');
      readln(car);
      end;
      if (pri = 'C') or (pri = 'A') then
        if (cantl > long) then
          long:= cantl;
    while (car = ' ') do begin
      write('Ingrese un caracter: ');
      readln(car);
      end;
    end;
  writeln('La longitud de la palabra mas larga que comienza con "C" o con "A" es de ',long,' letras');
  writeln('Ingrese ENTER para finalizar');
  readln;
end.
