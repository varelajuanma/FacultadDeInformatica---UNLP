Program ejer4C;
var
  car:char;
  cantl,min,min2:integer;
begin
  min:= 999;
  min2:= 999;
  write('Ingrese un caracter :');
  readln(car);
  while (car = ' ') do begin
    write('Ingrese un caracter :');
    readln(car);
    end;
  while (car <> '.') do begin
    cantl:= 0;
    while (car <> '.') and (car <> ' ') do begin
      cantl:= cantl + 1;
      write('Ingrese un caracter :');
      readln(car);
      end;
    if (cantl < min) then begin
      min2:= min;
      min:= cantl;
      end
    else
      if (cantl < min2) then
        min2:= cantl;
    while (car = ' ') do begin
      write('Ingrese un caracter :');
      readln(car);
      end;
    end;
  writeln('La longitud de la palabra mas corta es de ',min,' letras.');
  writeln('La longitud de la segunda palabra mas corta es de ',min2,' letras.');
  writeln('Ingrese ENTER para finalizar');
  readln;
end.
