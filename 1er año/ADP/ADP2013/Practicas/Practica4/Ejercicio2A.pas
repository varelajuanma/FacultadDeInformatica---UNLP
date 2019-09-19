Program ejer2A;
type
  conjletras= set of char;
var
  car: char;
  cantp,cantl: integer;
  letras: conjletras;
begin
  letras:= ['A'..'Z','a'..'z','0'..'9'];
  cantp:= 0;
  write('Ingrese un caracter: ');
  readln(car);
  while (car = ' ') do begin
    write('Ingrese un caracter: ');
    readln(car);
    end;
  while (car <> '.') do begin
    cantl:=0;
    while (car <> '.') and (car <> ' ') do begin
      if (not (car IN letras)) then
        cantl:= cantl + 1;
      write('Ingrese un caracter: ');
      readln(car);
      end;
    if (cantl >= 3) then
      cantp:= cantp + 1;
    while (car = ' ') do begin
      write('Ingrese un caracter: ');
      readln(car);
      end;
    end;
  writeln('La cantidad de palabras con al menos 3 caracteres especiales es de: ',cantp);
  writeln('Ingrese ENTER para finalizar');
  readln;
end.

end.
