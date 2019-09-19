Program ejer7;
Type
  conjletras = set of char;
var
  voc,leidos:conjletras;
  car:char;
  cantpal,cantvoc:integer;
begin
  voc:= ['a','e','i','o','u'];
  cantpal:= 0;
  write('Ingrese un caracter: ');
  readln(car);
  while (car = ' ') do begin
    write('Ingrese un caracter: ');
    readln(car);
    end;
  while (car <> '.') do begin
    cantvoc:= 0;
    leidos:= [];
    while (car <> '.') and (car <> ' ') do begin
      if (car IN voc) and NOT (car IN leidos) then begin
        cantvoc:= cantvoc + 1;
        leidos:= leidos + [car];
        end;
      write('Ingrese un caracter: ');
      readln(car);
      end;
    if (cantvoc = 3) then begin
      cantpal:= cantpal + 1;
      for car:= 'a' to 'z' do begin
        if (car IN leidos) then
          writeln ('Las vocal que aparecio es: ',car);
        end;
      end;
    while (car = ' ') do begin
      write('Ingrese un caracter: ');
      readln(car);
      end;
    end;
  writeln('La cantidad de palabras con 3 vocales diferentes son: ',cantpal);
  writeln('Ingrese ENTER para finalizar');
  readln();
end.
