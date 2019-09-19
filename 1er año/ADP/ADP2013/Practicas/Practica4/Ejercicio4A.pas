Program ejer4A;
var
  car,L1,L2: char;
  cantl: integer;
begin
  cantl:= 0;
  write('Ingrese un caracter para L1: ');
  readln(car);
  L1:= car;
  write('Ingrese un caracter para L2: ');
  readln(car);
  L2:= car;
  write('Ingrese un caracter: ');
  readln(car);
  while (car <> '.') do begin
    if (car = L1) then begin
      write('Ingrese un caracter: ');
      readln(car);
      while (car <> L2) do begin
        cantl:= cantl + 1;
        write('Ingrese un caracter: ');
        readln(car);
        end;
      end;
    write('Ingrese un caracter: ');
    readln(car);
    end;
  writeln('La cantidad de letras entre L1 y L2 es: ',cantl);
  writeln('Presione ENTER para finalizar');
  readln;
end.
